#### TEST CASE MODULE
package IC_flash;

use strict;
use File::Basename;
use File::Spec;
use File::Copy;
use File::Path qw( rmtree );

#### HERE SELECTION OF IMPORT MODULES ####
use LIFT_general;
use LIFT_equipment;
use LIFT_ProdDiag;
use LIFT_FaultMemory;
use LIFT_ECU_SW_Flash;

##################################

## testcase parameters

## other local vars

our $PURPOSE = "LIFT INIT CAMPAIGN for testarea development";

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> DOCUMENTATION >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

=head1 TESTCASE MODULE

IC_flash

=head1 PURPOSE

Decides if the ECU-SW needs to be flashed based on the output of TLM tooling.
If yes it flashes the ECU-SW that is taken either from the sandbox or from
an sartifactory download, depending on the build parameters.

If no nothing more is done.
If yes it checks if an artifactory ECU-SW build was downloaded by Jenkins.
If this is the case then it overwrites the ECU-SW in the sandbox with the downloaded build.
Finally it flashes the ECU-SW and re-initializes all testbench devices. 

=head1 TESTCASE DESCRIPTION

I<B<Initialisation>>

Initialize testbench devices in 'FLASH_ONLY' section.

Decide if flashing is required based on the output files of TLM tooling 
(nextBatchFile.txt and previousBatchFile.txt) and also get the hex file type 
to be flashed ('default' or 'EDR' or another parameterized hex file).

If ECU is not in normal mode then also flashing is required

If flashing is required then:

Try to find an artifactory download by Jenkins. If it exists then overwrite the
existing ECU-SW in the sandbox with the downloaded ECU-SW.

Copy hex-file and dflash-hex-file as defined by hex file type to a temporary folder.

Flash the ECU with the hex files in the temporary folder.

Re-Initialize testbench devices in 'FLASH_ONLY' section.

I<B<Stimulation and Measurement>>

Read Bosch fault memory

I<B<Evaluation>>

nothing

I<B<Finalisation>>

nothing

=head1 PARAMETER DESCRIPTION

no parameters

=cut

##################################
####  TESTCASE STARTS HERE    ####
##################################

my $tcPar_functions;

sub TC_set_parameters {

    return 1;
}

#### INITIALIZE TC #####
sub TC_initialization {

    S_teststep(" *** Starting Init Campaign ***");

	EQUIP_init_testbench('FLASH_ONLY');

    EQUIP_init_testbench('FLASH_ONLY') if (ECU_SW_Jenkins_CT_AutoFlash());

    S_teststep(" IC -> set verdict PASS to finish init campaign");
    S_set_verdict(VERDICT_PASS);

    return 1;
}

### STIMULATION AND MEASUREMENT ###
sub TC_stimulation_and_measurement {
    S_teststep( "Read FCM 'Bosch' (directly after SW Flash)" );
    LIFT_FaultMemory->read_fault_memory('Bosch');
    return 1;
}

#### EVALUATE TC #####
sub TC_evaluation {

    return 1;
}

#### TC FINALIZATION #####
sub TC_finalization {
    return 1;
}

=head1 FUNCTIONS

=head2 GetHexFileType

    $hexFileType = GetHexFileType( $batchInfoFile );

Reads the first line of $batchInfoFile that contains a batch file name.
The batch file names created by TLM tooling have the following form:

 <HexFileType>_TLM_<TestArea>-<HexFileType>_<TestBench>_<TestType>_<...>.bat

The leading <HexFileType> is extracted and returned.

B<Arguments:>

=over

=item $batchInfoFile 

Batch info file as created by TLM tooling 
(either nextBatchFile.txt or previousBatchFile.txt)

=back

B<Return Value:>

=over

=item $hexFileType 

<HexFileType> as per TLM batch file naming convention.

=back

=cut

sub GetHexFileType{
    my $batchInfoFile = shift;
    
    unless( -f $batchInfoFile ){
        S_w2log(1, "IC_flash Info: Batch information file $batchInfoFile does not exist.\n");
        return;
    };
    
    my $in_fh;
    unless ( open( $in_fh, '<', $batchInfoFile ) ) {
        S_set_error( "Could not open input file $batchInfoFile : $!", 109 );
        return;
    }
    my @lines = <$in_fh>;
    close $in_fh;

    my $line = shift @lines;
    my $hexFileType;
    if( $line =~ /^([a-zA-Z0-9]+)_TLM/ ) {
        $hexFileType = $1;
    }
    else{
        S_w2rep("Warning: Could not get hex file. Extracted batch file name does not follow naming conventions: $line\n");
    }
    return $hexFileType;
}

=head2 GetHexFilePath

    $tempHexFilePath = GetHexFilePath( $hexFileType );

Based on the SAD file path that is configured in main CFG file, find the hex file
depending on $hexFileType.
If $hexFileType == 'default' then the hex file is in the same folder as the SAD file.
If $hexFileType != 'default' then the hex file is in folder
'parametersets\<hexFileTypeSubfolder>'.
The found hex file and also dflash hex file are copied to a temporary folder (C:\temp\LIFT) 
to avoid problems with path length in the flash tool.

B<Arguments:>

=over

=item $hexFileType 

<HexFileType> as per TLM batch file naming convention.

=back

B<Return Value:>

=over

=item $tempHexFilePath 

Path of the hex file in the temporary folder.

=back

=cut

sub GetHexFilePath{
    my $hexFileType = shift;

    my $defaultSadPath = $LIFT_config::SAD_file;
    unless ($defaultSadPath){
        S_set_error("Could not get SAD file from LIFT_config"); 
        return; 
    }

    # searching for the actual SAD file in the results folder; could be different because of downloaded artifactory files
    my $sadFolder = dirname($defaultSadPath);
    my $files_aref = GetFilesInDirectory($sadFolder);
    my $sadFile;
    foreach my $file ( @$files_aref ) {
        if( $file =~ /\.sad$/i ) {
            $sadFile = $file;
            last;
        }
    }

    if( not defined $sadFile ) {
        S_set_error("Could not find a SAD file in results folder $sadFolder");
        return; 
    }

    my $defaultHexPath = $sadFolder.'/'.$sadFile;
    $LIFT_config::SAD_file = $defaultHexPath; # for re-initializing test bench
    $defaultHexPath =~ s/\.sad$/.hex/i;
    $defaultHexPath =~ s/\//\\/g;

    $defaultHexPath = File::Spec->rel2abs($defaultHexPath);
    $defaultHexPath = File::Spec->canonpath($defaultHexPath);
    
    S_w2log(1, "IC_flash Info: Default hex file path: $defaultHexPath\n");
    
    my $dflashHexPath = $defaultHexPath;
    $dflashHexPath =~ s/\.hex$/_dflash.hex/;

    if( not defined $hexFileType or lc($hexFileType) eq 'default' ) {
        # copying the hex files to a temp folder is necessary to avoid path length issues with Windows and Perl
        my $tempDefaultHexPath = CopyFileToTemp($defaultHexPath) or return;
        CopyFileToTemp($dflashHexPath) or return;

        return $tempDefaultHexPath;
    }

    S_w2log(1, "IC_flash Info: Getting hex file path for type '$hexFileType'...\n");

    my $paramSetDir = dirname($defaultHexPath)."/parametersets";
    $files_aref = GetFilesInDirectory($paramSetDir);

    my $hexPathFound;
    foreach my $subdir ( @$files_aref ) {
        my $hexPath = "$paramSetDir/$subdir";
        if( -d $hexPath and $subdir =~ /$hexFileType/ ) {
            $hexPathFound = $hexPath;
            last;
        }
    }
    
    if( not defined $hexPathFound ) {
        S_set_error("Could not find folder for hex file type '$hexFileType' in $paramSetDir");
        return; 
    }
    
    $files_aref = GetFilesInDirectory($hexPathFound);
    my $hexFile;
    foreach my $file ( @$files_aref ) {
        if( $file =~ /\.hex$/i ) {
            $hexFile = $file;
            last;
        }
    }

    if( not defined $hexFile ) {
        S_set_error("Could not find any .hex file in $hexPathFound");
        return; 
    }

    my $hexFilePath = $hexPathFound . '/' . $hexFile;
    S_w2log(1, "IC_flash Info: Hex file path for type '$hexFileType' is: $hexFilePath\n");
    
    # copying the hex files to a temp folder is necessary to avoid path length issues with Windows and Perl
    my $tempHexFilePath = CopyFileToTemp($hexFilePath) or return;    
    my $dflashHexFile = $hexFile;
    $dflashHexFile =~ s/\.hex$/_dflash.hex/;
    CopyFileToTemp($dflashHexPath, $dflashHexFile) or return;

    return $tempHexFilePath;
}

#### GetBuildDownloadIfRequired #####
sub GetSWBuildDownloadIfRequired{
    my $batchPath = shift;
    
    my $downloadFolder = $batchPath.'/../../resultsDownload'; # The download path is defined by Jenkinsfile!
    $downloadFolder = File::Spec->canonpath($downloadFolder);
    if( not -d $downloadFolder ) {
        S_w2log(1, "IC_flash Info: No build download folder found ($downloadFolder). ECU SW will be taken from sandbox results folder.\n");
        return 'ECU-SW from testing stream';
    }

    S_w2log(1, "IC_flash Info: Getting ECU SW from build download in folder $downloadFolder\n");
    my $buildFolder = GetBuildFolder($downloadFolder) or return;
    my ($compilerResults, $parametersetResults) = GetZipResultFiles($buildFolder);
    return if not defined $compilerResults;
    DeleteSandboxResults($downloadFolder) or return;
    UnzipResults($buildFolder.'/'.$compilerResults, $downloadFolder) or return;
    if( defined $parametersetResults ) {
        UnzipResults($buildFolder.'/'.$parametersetResults, $downloadFolder, 'parametersets') or return;
    }
    S_w2log(1, "IC_flash Info: ECU SW successfully extracted from build download\n");
    my $buildName = basename($buildFolder);
    my $ecuSWbuildText = "ECU-SW from build $buildName $compilerResults";
    return $ecuSWbuildText;
}

#### GetBuildFolder #####
sub GetBuildFolder{
    my $path = shift;
    my $files_aref = GetFilesInDirectory($path);
    if( @$files_aref == 0 ) {
        S_set_error( "No build folder found in $path" );
        return;
    }
    elsif( @$files_aref > 1 ) {
        S_set_error( "More than one element found in $path. Don't know which to use." );
        return;
    }
    my $buildFolder = $$files_aref[0];
    S_w2log(1, "IC_flash Info: Build folder found: $buildFolder\n");
    if( not -d $path.'\\'.$buildFolder ) {
        S_set_error( "Build folder '$buildFolder' is not a folder." );
        return;
    }
    return $path.'\\'.$buildFolder;
}

#### GetZipResultFiles #####
sub GetZipResultFiles{
    my $path = shift;
    my $files_aref = GetFilesInDirectory($path);
    my ($compilerResults, $parametersetResults, $buildNumber);
    foreach my $file ( @$files_aref ) {
        if( $file =~ /^Compiler_Results_(\d+)\.zip$/ ) {
            $buildNumber = $1;
            $compilerResults = $file;
            S_w2log(1, "IC_flash Info: Compiler results zip file found: $compilerResults\n");
        }
        elsif( $file =~ /^SwParametersetBuild_Results_(\d+)\.zip$/ ) {
            my $paraBuildNumber = $1;
            if( $paraBuildNumber =! $buildNumber ) {
                S_set_warning( "Build number of SwParametersetBuild_Results ($paraBuildNumber) is not the same as the build number of Compiler_Results ($buildNumber)." );
                next;
            }
            $parametersetResults = $file;
            S_w2log(1, "IC_flash Info: SwParametersetBuild results zip file found: $parametersetResults\n");
        }
    }
    if( not defined $compilerResults ) {
        S_set_error( "Could not find Compiler results zip file" );
    }
    return ($compilerResults, $parametersetResults);
}

#### DeleteSandboxResults #####
sub DeleteSandboxResults{
    my $downloadFolder = shift;

    S_w2log(1, "IC_flash Info: Deleting results folder from sandbox...\n");
    my $sandboxResultsFolder = ResultFolderFromDownloadFolder($downloadFolder);
    if( not -d $sandboxResultsFolder ) {
        S_set_error( "Results folder from sandbox does not exist: $sandboxResultsFolder" );
        return;
    }
    rmtree $sandboxResultsFolder;
    if( -d $sandboxResultsFolder ) {
        S_set_error( "Could not delete sandbox result folder: $sandboxResultsFolder" );
        return;
    }
    mkdir $sandboxResultsFolder;
    if( not -d $sandboxResultsFolder ) {
        S_set_error( "Could not create empty folder: $sandboxResultsFolder" );
        return;
    }
    return 1;
}

#### UnzipResults #####
sub UnzipResults{
    my $zipFile = shift;
    my $downloadPath = shift;
    my $relativeDestination = shift;
    
    my $sandboxResultsFolder = ResultFolderFromDownloadFolder($downloadPath);
    my $destination = $sandboxResultsFolder;
    if( defined $relativeDestination ) {
        $destination .= '/'.$relativeDestination;
    }
    S_w2log(1, "IC_flash Info: Unzipping $zipFile to $destination...\n");
    if( not -e $zipFile ) {
        S_set_error( "Zip file to be extracted does not exist: $zipFile" );
        return;
    }
	my $zip_handle = S_open_zip ( $zipFile );
    my @fileList = S_get_filelist_from_zip ( $zip_handle );
	S_get_from_zip ($zip_handle, $destination, @fileList);
	return 1;
}

#### ResultFolderFromDownloadFolder #####
sub ResultFolderFromDownloadFolder{
    my $downloadFolder = shift;
    
    my $sandboxResultsFolder = $downloadFolder.'/../results'; # The download path is defined by Jenkinsfile!
    $sandboxResultsFolder = File::Spec->canonpath($sandboxResultsFolder);
    return $sandboxResultsFolder;
}


#### GetFilesInDirectory #####
sub GetFilesInDirectory{
    my $directory = shift;

    my $dirHandle;
    unless ( opendir( $dirHandle, $directory ) ) {
        S_set_error( "Could not open directory $directory : $!" );
        return;
    }
    my @files = readdir $dirHandle;
    close $dirHandle;

    my @outFiles;
    foreach my $file ( @files ) {
        next if $file eq '.' or $file eq '..';
        push(@outFiles, $file);
    }
    
    return \@outFiles;
}

#### RenameFile #####
sub RenameFile{
    my $oldName = shift;
    my $newName = shift;

    my $success = rename($oldName, $newName);
    if( not $success ){
        S_set_error("Could not rename $oldName to $newName : $!");
        return;
    }
    return 1;
}

#### CopyFileToTemp #####
sub CopyFileToTemp{
    my $path = shift;
    my $newName = shift;

    my $tempPath = 'C:\temp\LIFT';
    my $fileName = basename($path);
    my $newPath = $tempPath . '\\' . $fileName;
    if( defined $newName ) {
        $newPath = $tempPath . '\\' . $newName;
    }

    S_w2log(2, "IC_flash Info: Copying '$path' to '$newPath' ...\n");
    my $success = copy( $path, $newPath);
    if( not $success ){
        S_set_error("Could not copy $path to $newPath : $!");
        return;
    }

    return $newPath;
}

1;

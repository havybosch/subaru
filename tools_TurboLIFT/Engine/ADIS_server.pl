#################################################################################
# this tool is under version management
my $VERSION = 'SCM';
#################################################################################

BEGIN
{
	# add directories to search path for perl modules    
    use Config;
    use File::Spec;
    use File::Basename;
    my $addpath = File::Spec->rel2abs(dirname(__FILE__)) . "/modules/Device_layer/ADIS";
    $addpath =~ s/\//\\/g; # replace all slashes with backslahes
    
    unshift @INC, ($addpath);    #Include ADIS.pm from Root directory
}

=head1 NAME

ADIS_server - Perl server for robot arm reference sensor

=head1 SYNOPSIS

just start the server by doubleclick: TCP port 9010

use ADIS_client_dummy to simulate client

=head1 DESCRIPTION

=head2 any LIFT_TSG4 command

any of the LIFT commands from LIFT_TSG4.pm will be executed and values (with verdict added first) returned as text. See docu for commands and return values.

	e.g. request 'TSG4_SetVoltage( 'U_BATT_DEFAULT' )' will get response 'VERDICT_NONE' if executed successfully
	     request 'TSG4_lowlevel_command("rc_get_firmware(1)")) will get response 'VERDICT_NONE',0,'FW_X0013' if executed successfully

=for html
<a href='..\..\..\Engine\Documentation\html\modules\LIFT_TSG4.html' target="blank">link to LIFT_TSG4.pm docu</a><br>

=head2 any LIFT_DMM1 command

any of the low level commands from DMM.pm will be executed and values returned as text. See docu for commands and return values.

=for html
<a href='..\..\..\Engine\Documentation\html\modules\LIFT_DMM1.html' target="blank">link to LIFT_DMM1.pm docu</a><br>



=head2 server requests

dump_data([$addesslist],$samples,$dumpfile)

 $addesslist elements may be
 XGYRO_OUT YGYRO_OUT ZGYRO_OUT XACCL_OUT YACCL_OUT ZACCL_OUT XMAGN_OUT YMAGN_OUT ZMAGN_OUT TEMP_OUT

 on request 'PING' you will get 'PONG' response
 
 on request 'ServerVersion' you will get e.g. 'Revision: 1.5 ' response

 on request 'dump_data([XACCL_OUT,YACCL_OUT],10000,mydump.txt)' you will get immediate 'dumping' response that dump has started

 on request 'get_dumpfile' you will get e.g. 'mydump.txt ' response, this may take some time (after dump finished)

=head2 unknown

on unknown command, server will return '? unknown command'


=head1 AUTHOR

Frank BE<ouml>hm, E<lt>Frank.Boehm@de.bosch.comE<gt>

=head1 SEE ALSO

perl

=cut 


use strict;
use warnings;
use ADIS;

my ($SOCKET,$PORT,$timeout,$Connect_Count);
my $dumpfile = '';
my ($status,$ERRORflag);
my $str='';
$ERRORflag=0;

my %name_adress_map =(
	'XGYRO_OUT' =>0x04,
	'YGYRO_OUT' =>0x06,
	'ZGYRO_OUT' =>0x08,
	'XACCL_OUT' =>0x0A,
	'YACCL_OUT' =>0x0C,
	'ZACCL_OUT' =>0x0E,
	'XMAGN_OUT' =>0x10,
	'YMAGN_OUT' =>0x12,
	'ZMAGN_OUT' =>0x14,
	'TEMP_OUT' =>0x16,
);


system("Color 0E");
open ( LOG, ">ADIS_server_log.txt" );     # open shell logfile
select((select(LOG), $|=1)[0]);       # Make LOG hot.(autoflush)

w2log( "ADIS_server $VERSION logfile\n\n");
w2log("\n*** ADIS_server started ***\n\n");

init();

#execute loop only if no error
if ($ERRORflag == 0){
    until (lc($str) eq "exit"){
        Open_socket_Connection();
        my $loopcount = 0;
        $str="";
        until (lc($str) eq "restart") {
            #$loopcount++;
            $str = Read_socket();
            last if ($str =~ /\bexit\b|\brestart\b/i);
            {
             no warnings; # bad hack to exit loop on error
             exec_command($str) or ($str='exit' and last);
            }
        }

        Close_socket_Connection();

        w2log("perl: connection closed\n");

#        wait_ms(1000);
    }

#    wait_ms(1000);
}

$status = adis_Disconnect();
w2log("adis_Disconnect $status\n");

w2log("\n*** ADIS_server stopped ***\n\n");

close (LOG);
#system('pause');

################
#  subroutines
################


sub w2log{
    my $text = shift;
    print LOG "$text";
    print "$text";
}

sub exec_command{
    my $command = shift;
    
    if($command eq ""){
    }
    elsif ($command eq "ServerVersion"){
        w2log("$VERSION\n");
        Write_socket($VERSION);
    }
    elsif ($command eq "PING"){
        w2log("playing ping pong\n");
		Write_socket("PONG");
    }
    elsif ($command =~ /^dump_data\(\[(\S+)\],(\d+),(\S+)\)/){
    	$dumpfile = '';
		Write_socket("dumping");
        w2log("dumping data to file\n");
        $dumpfile=dump_data($1,$2,$3);
    }
    elsif ($command eq "get_dumpfile"){
        w2log("dumpfile is $dumpfile\n");
		Write_socket($dumpfile);
    }
    else {w2log("? unknown command: $command or timeout\n");Write_socket("? unknown command or timeout");}

}

sub init{
    my ($errorcount);
    $errorcount = 0;
	
	$status = adis_Start();
	w2log("adis_Start $status\n");
	 
	$status = adis_Connect();
	w2log("adis_Connect $status\n");
	
	my $firmware = adis_FirmwareInfo();
	w2log("adis_FirmwareInfo $firmware\n");
	
}

sub dump_data{
    my $adresses=shift;
    my $samples=shift;
    my $file=shift;
    
    my @addr = split(/,/, $adresses);
	my @names = @addr;
	#replace name by adress if defined in mapping
	foreach my $item (@addr){
		$item = $name_adress_map{$item} if exists $name_adress_map{$item};
	}
    
    my $data_aref = adis_ReadArray(\@addr, $samples);
    
    my $addr_count = scalar(@addr);
    my $time = 1;
    
    if (open(my $fh, '>', $file)){
    	print $fh "Sample #;".join(';',@names)."\n";	
    	
    	while (my @row = splice(@$data_aref,0,$addr_count)){
    		printf $fh ("%d;%s\n",$time,join(';',@row));
			$time++;
    	}
    }
    else{w2log("error file open : $!\n");return 'error'}
	
	return $file;
}

sub Open_socket_Connection{
    use IO::Socket;
    use Net::hostent;               # for OO version of gethostbyaddr
    # Set up the server object

    $PORT = 9010;
    $timeout = 60000;
    
    my $server = IO::Socket::INET->new(    Proto     => 'tcp',
    #Type => SOCK_STREAM, 
                                        LocalPort => $PORT,
                                        Listen    => SOMAXCONN,
                                        Reuse     => 1,
                                        Timeout   => $timeout);

    die "can't setup TCP server" unless $server;
    
    $Connect_Count++;
    printf "Server port: $PORT Timeout value: $timeout Connect count: $Connect_Count\n";
    
    # Now set up a client filehandle, $SOCKET. This will be a global used in other places
    $SOCKET = $server->accept(); 
    
    $SOCKET->autoflush(1);
    printf "SOCKET connected \n";
    return $SOCKET;
    
}


sub Close_socket_Connection{
    close($SOCKET);
    print"server closed\n";
}

sub Write_socket{ 
my $out = shift;
    if ($SOCKET) 
    {
        print $SOCKET $out."\r\n";      # Send command     
        print "S-> $out\n";
    } 
    else 
    {
        return 0;
    }
    
}


sub Read_socket{
my $in;
    while ($in=<$SOCKET>) 
    {
        next unless $in =~ /\S/;             # ignore blank lines
        $in =~ s/\r\n$//;
        chomp($in);
        print"<-R $in\n";
        return $in;
    }
}


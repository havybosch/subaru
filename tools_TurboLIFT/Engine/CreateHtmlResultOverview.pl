#!/usr/bin/perl
# Overview script by M.Geisler (EPS2)

#The structure here is a little tricky...
# 1) this script is run by LIFT after each test run and it creates an html page listing all reports.
# 2) on this HTML page, there is javascript code which will delete or archive reports as follows:
#    a) all ticked reports are collected
#    b) for each report, some perl code is generated 
#       i) to delete or archive the respective report files
#       ii) (only for delete actions): to re-run this script itself to update the list of reports
#    c) this perl code is saved to a temp perl script file (___temp___.pl)
#    d) the perl code is executed from javascript
#       i) the reports are deleted/archived
#       ii) the report page is updated by running this script again.

use strict; 
use warnings;

use HTML::Template;
use File::stat;
use IO::Dir;
use Getopt::Long;
use Cwd 'abs_path';
use File::Find;

my $target_dir;
my $openpage;
my $main_LOG_name = '_main__result.html';

GetOptions('dir=s' => \$target_dir, 'openpage!' => \$openpage );
if (!defined $target_dir)
{
    #to run this from explorer by double click:
    $target_dir = '.\\..\\reports';
}

#fix the path
$target_dir = abs_path($target_dir);
$target_dir =~ s/\//\\/g;

print"Generating report overview: Scanning ".$target_dir."\n";

sub GetDate {
    my ($filename) = @_;
    my $m;
    my $y;
    my $d;
    my $s;
    my $min;
    my $h;
    my $returnval="";
    
    if ( open (HANDLE,"$filename") )
    {
        ($s,$min,$h,$d,$m,$y) = localtime( (stat ($filename))->mtime );
        close (HANDLE);
        $m=$m+1;
        $y=$y-100;
        $y=sprintf("%02d", $y); $m=sprintf("%02d", $m); $d=sprintf("%02d", $d);
        $returnval="$d.$m.$y $h:$min:$s";
    }
    else
    {
        #warn "*** unknown file $filename\n";
        $returnval="--";
    }
    return $returnval;
}


# create a list of all _main__result.html files in the sub-folders of the current directory
my @files;
find( \&search_html, $target_dir );

sub search_html{
		
	if( /$main_LOG_name$/ ) {
		push @files, $File::Find::name;
	}
	
}


# create data for the hmtl page
my @files_loop;
my $datetime;
my $date_fromfilesystem;
my $timetemp;

my $resulttxtfile;
my $resulttextfilehandle;
my $runname;
my %count;
my $failstring;
my $inconcstring;

my $tmpl = HTML::Template->new(filehandle => \*DATA);
if (scalar(@files) == 0)
{
    push @files_loop, {
        LINES => [  {LINE => "<input type=\"hidden\" name=\"selectit\" value=\"".$target_dir."\\nothingfound\">"}, 
                    {LINE => "<div style=\"background-color:pink;\">No LIFT reports found in folder '$target_dir'.<div>"}, 
                    {LINE => "-"}, 
                    {LINE => "-"},
                    {LINE => "-" },
                    {LINE => "-" },
                    {LINE => "-" },
                    {LINE => "-" },
                    {LINE => "-" },
                    {LINE => "-" },
                 ]
    };
    $tmpl->param(DISABLEBUTTONS => 'disabled="disabled"');
}
else
{
    for my $file (@files) {        
            $date_fromfilesystem = GetDate("$file");
            #get date from filename if possible
            if ($file =~ /(\d{4})(\d{2})(\d{2})_(\d{2})(\d{2})(\d{2})\//)
            {
                $datetime="$3.$2.$1 $4:$5:$6";
            }
            else
            {
                $datetime="no date found";
            }

            #read summary file and count testcases
            $resulttxtfile = $file;
            $resulttxtfile =~ s/\.html$/.txt/i;
			
			# determine the root folder to give option "view folder"
            my $rootFolder = "";
            if($file =~ /(.*?)[\\\/][^\\\/]*?\.html/i) {
                $rootFolder = "$1";
            }
            
            if (-e $resulttxtfile)
            {
                $count{"PASS"}=0;
                $count{"FAIL"}=0;
                $count{"NONE"}=0;
                $count{"INCONC"}=0;

                open $resulttextfilehandle, '<', $resulttxtfile;
                while (<$resulttextfilehandle>)
                {
                    if (/TC_VD;[^;]*;VERDICT_([^;]*);/)
                    {
                        $count{$1}++;
                    }
                }
            }
            else
            {
                #no file found, problem??
                $count{"PASS"}=-1;
                $count{"FAIL"}=-1;
                $count{"NONE"}=-1;
                $count{"INCONC"}=-1;
            }

            $count{"TOTAL"}=$count{"FAIL"}+$count{"INCONC"}+$count{"NONE"}+$count{"PASS"};
            
            my %showstring;
            my %color = ( "PASS" => "#33CC33", "FAIL" => "red", "NONE" => "blue", "INCONC" => "purple", "TOTAL" => "black"  );
            foreach my $key (keys %count)
            {
                if ($count{$key} > 0 )
                {
                    $showstring{$key} = "<div style=\"color: ".$color{$key}."; font-weight:bold;\">".$count{$key}."</div>";
                }
                else
                {
                    if ($count{$key} == 0 )
                    {
                        $showstring{$key} = "<div style=\"color: #bbbbbb;\">".$count{$key}."</div>";
                    }
                    else
                    {
                        #if the result file is missing, we get negative values...
                        $showstring{$key} = "<div style=\"color: #eeeeee; \">".$count{$key}."</div>";
                    }
                }
            }
            
			# look for something like /xyz/_main__result.html and assign only xyz (i.e. the run name) to $runname
            if( $file =~ /\/(\w+)\/\w+\.\w+$/){
            	$runname = $1;
            }
            else{
            	$runname = $file;
            }

            push @files_loop, {
                LINES => [  {LINE => "<a href=\"file:///$file\">$runname</a>"}, 
                            {LINE => $datetime}, 
                            {LINE => $date_fromfilesystem},
                            {LINE => $showstring{"FAIL"} },
                            {LINE => $showstring{"INCONC"} },
                            {LINE => $showstring{"NONE"} },
                            {LINE => $showstring{"PASS"} },
                            {LINE => $showstring{"TOTAL"} },
                            {LINE => "<div class='viewfolder'> <a href=\"file:///$rootFolder\">View folder</a></div>" },
                         ]
            };
    }
}

$tmpl->param(FILES => \@files_loop );

my $targetfile = "$target_dir\\Reports.html";
my $fh;
open $fh, ">$targetfile";
print $fh  $tmpl->output;
close $fh;

if ($openpage)
{
    system("start file:///$targetfile") == 0 or print "*** Error opening the overview in browser: $!\n";
}

#template

__DATA__
<!DOCTYPE HTML PUBLIC "-//W3C//HTML 3.2 Final//EN">
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1252">
<META NAME="Generator" CONTENT="LIFT overview generator scripot">
<title>LIFT Testcase Report Overview</title>
<script type="text/javascript" src="../Engine/htmldata/js/jquery-latest.js"></script> 
<script type="text/javascript" src="../Engine/htmldata/js/jquery.tablesorter.js"></script> 

<!-- plugin -->
<script type="text/javascript">
    /*
    jQuery.twFile.js
    jQuery plugin for loading a file and saving data to a file
    Copyright (c) UnaMesa Association 2009
    Triple licensed under the BSD, MIT and GPL licenses:
      http://www.opensource.org/licenses/bsd-license.php
      http://www.opensource.org/licenses/mit-license.php
      http://www.gnu.org/licenses/gpl.html
    */


    (function($) {
        if(!$.twFile) {
            $.twFile = {};
        }

        $.extend($.twFile,{
            currentDriver: null,
            driverList: ["activeX", "mozilla", "tiddlySaver", "javaLiveConnect"],

            // Loads the contents of a text file from the local file system
            // filePath is the path to the file in these formats:
            //    x:\path\path\path\filename - PC local file
            //    \\server\share\path\path\path\filename - PC network file
            //    /path/path/path/filename - Mac/Unix local file
            // returns the text of the file, or null if the operation cannot be performed or false if there was an error
            load: function(filePath) {
                return this.getDriver().loadFile(filePath);
            },
            // Saves a string to a text file on the local file system
            // filePath is the path to the file in the format described above
            // content is the string to save
            // returns true if the file was saved successfully, or null if the operation cannot be performed or false if there was an error
            save: function(filePath,content) {
                return this.getDriver().saveFile(filePath,content);
            },
            // Copies a file on the local file system
            // dest is the path to the destination file in the format described above
            // source is the path to the source file in the format described above
            // returns true if the file was copied successfully, or null if the operation cannot be performed or false if there was an error
            copy: function(dest,source) {
                if(this.getDriver().copyFile)
                    return this.currentDriver.copyFile(dest,source);
                else
                    return null;
            },
            // Converts a local file path from the format returned by document.location into the format expected by this plugin
            // url is the original URL of the file
            // returns the equivalent local file path
            convertUriToLocalPath: function (url) {
                // Remove any location or query part of the URL
                var originalPath = url.split("#")[0].split("?")[0];
                // Convert file://localhost/ to file:///
                if(originalPath.indexOf("file://localhost/") == 0)
                    originalPath = "file://" + originalPath.substr(16);
                // Convert to a native file format
                //# "file:///x:/path/path/path..." - pc local file --> "x:\path\path\path..."
                //# "file://///server/share/path/path/path..." - FireFox pc network file --> "\\server\share\path\path\path..."
                //# "file:///path/path/path..." - mac/unix local file --> "/path/path/path..."
                //# "file://server/share/path/path/path..." - pc network file --> "\\server\share\path\path\path..."
                var localPath;
                if(originalPath.charAt(9) == ":") // PC local file
                    localPath = unescape(originalPath.substr(8)).replace(new RegExp("/","g"),"\\");
                else if(originalPath.indexOf("file://///") == 0) // Firefox PC network file
                    localPath = "\\\\" + unescape(originalPath.substr(10)).replace(new RegExp("/","g"),"\\");
                else if(originalPath.indexOf("file:///") == 0) // Mac/UNIX local file
                    localPath = unescape(originalPath.substr(7));
                else if(originalPath.indexOf("file:/") == 0) // Mac/UNIX local file
                    localPath = unescape(originalPath.substr(5));
                else if(originalPath.indexOf("//") == 0) // PC network file
                    localPath = "\\\\" + unescape(originalPath.substr(7)).replace(new RegExp("/","g"),"\\");
                return localPath || originalPath;
            },

            // Private functions

            // Returns a reference to the current driver
            getDriver: function() {
                if(this.currentDriver === null) {
                    for(var t=0; t<this.driverList.length; t++) {
                        if(this.currentDriver === null && drivers[this.driverList[t]].isAvailable && drivers[this.driverList[t]].isAvailable())
                            this.currentDriver = drivers[this.driverList[t]];
                    }
                }
                return this.currentDriver;
            }
        });

        // Deferred initialisation for any drivers that need it
        $(function() {
            for(var t in drivers) {
                if(drivers[t].deferredInit)
                    drivers[t].deferredInit();
            }
        });

        // Private driver implementations for each browser

        var drivers = {};

        // Internet Explorer driver

        drivers.activeX = {
            name: "activeX",
            isAvailable: function() {
                try {
                    var fso = new ActiveXObject("Scripting.FileSystemObject");
                } catch(ex) {
                    return false;
                }
                return true;
            },
            loadFile: function(filePath) {
                // Returns null if it can't do it, false if there's an error, or a string of the content if successful
                try {
                    var fso = new ActiveXObject("Scripting.FileSystemObject");
                    var file = fso.OpenTextFile(filePath,1);
                    var content = file.ReadAll();
                    file.Close();
                } catch(ex) {
                    //# alert("Exception while attempting to load\n\n" + ex.toString());
                    return null;
                }
                return content;
            },
            createPath: function(path) {
                //# Remove the filename, if present. Use trailing slash (i.e. "foo\bar\") if no filename.
                var pos = path.lastIndexOf("\\");
                if(pos!=-1)
                    path = path.substring(0,pos+1);
                //# Walk up the path until we find a folder that exists
                var scan = [path];
                try {
                    var fso = new ActiveXObject("Scripting.FileSystemObject");
                    var parent = fso.GetParentFolderName(path);
                    while(parent && !fso.FolderExists(parent)) {
                        scan.push(parent);
                        parent = fso.GetParentFolderName(parent);
                    }
                    //# Walk back down the path, creating folders
                    for(i=scan.length-1;i>=0;i--) {
                        if(!fso.FolderExists(scan[i])) {
                            fso.CreateFolder(scan[i]);
                        }
                    }
                    return true;
                } catch(ex) {
                }
                return false;
            },
            copyFile: function(dest,source) {
                drivers.activeX.createPath(dest);
                try {
                    var fso = new ActiveXObject("Scripting.FileSystemObject");
                    fso.GetFile(source).Copy(dest);
                } catch(ex) {
                    return false;
                }
                return true;
            },
            saveFile: function(filePath,content) {
                // Returns null if it can't do it, false if there's an error, true if it saved OK
                drivers.activeX.createPath(filePath);
                try {
                    var fso = new ActiveXObject("Scripting.FileSystemObject");
                    var file = fso.OpenTextFile(filePath,2,-1,0);
                    file.Write(content);
                    file.Close();
                } catch (ex) {
                    return null;
                }
                return true;
            }
        };

        // Mozilla driver

        drivers.mozilla = {
            name: "mozilla",
            isAvailable: function() {
                return !!window.Components;
            },
            loadFile: function(filePath) {
                // Returns null if it can't do it, false if there's an error, or a string of the content if successful
                if(window.Components) {
                    try {
                        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
                        file.initWithPath(filePath);
                        if(!file.exists())
                            return null;
                        var inputStream = Components.classes["@mozilla.org/network/file-input-stream;1"].createInstance(Components.interfaces.nsIFileInputStream);
                        inputStream.init(file,0x01,00004,null);
                        var sInputStream = Components.classes["@mozilla.org/scriptableinputstream;1"].createInstance(Components.interfaces.nsIScriptableInputStream);
                        sInputStream.init(inputStream);
                        var contents = sInputStream.read(sInputStream.available());
                        sInputStream.close();
                        inputStream.close();
                        return contents;
                    } catch(ex) {
                        //# alert("Exception while attempting to load\n\n" + ex);
                        return false;
                    }
                }
                return null;
            },
            saveFile: function(filePath,content) {
                // Returns null if it can't do it, false if there's an error, true if it saved OK
                if(window.Components) {
                    try {
                        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                        var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
                        file.initWithPath(filePath);
                        if(!file.exists())
                            file.create(0,0664);
                        var out = Components.classes["@mozilla.org/network/file-output-stream;1"].createInstance(Components.interfaces.nsIFileOutputStream);
                        out.init(file,0x20|0x02,00004,null);
                        out.write(content,content.length);
                        out.flush();
                        out.close();
                        return true;
                    } catch(ex) {
                        alert("Exception while attempting to save\n\n" + ex);
                        return false;
                    }
                }
                return null;
            }
        };

        // TiddlySaver driver

        drivers.tiddlySaver = {
            name: "tiddlySaver",
            deferredInit: function() {
                if(!document.applets["TiddlySaver"] && !$.browser.mozilla && !$.browser.msie && document.location.toString().substr(0,5) == "file:") {
                    $(document.body).append("<applet style='position:absolute;left:-1px' name='TiddlySaver' code='TiddlySaver.class' archive='TiddlySaver.jar' width='1'height='1'></applet>");
                }
            },
            isAvailable: function() {
                return !!document.applets["TiddlySaver"];
            },
            loadFile: function(filePath) {
                var r;
                try {
                    if(document.applets["TiddlySaver"]) {
                        r = document.applets["TiddlySaver"].loadFile(javaUrlToFilename(filePath),"UTF-8");
                        return (r === undefined || r === null) ? null : String(r);
                    }
                } catch(ex) {
                }
                return null;
            },
            saveFile: function(filePath,content) {
                try {
                    if(document.applets["TiddlySaver"])
                        return document.applets["TiddlySaver"].saveFile(javaUrlToFilename(filePath),"UTF-8",content);
                } catch(ex) {
                }
                return null;
            }
        }

        // Java LiveConnect driver

        drivers.javaLiveConnect = {
            name: "javaLiveConnect",
            isAvailable: function() {
                return !!window.java && !!window.java.io && !!window.java.io.FileReader;
            },
            loadFile: function(filePath) {
                var r;
                var content = [];
                try {
                    r = new java.io.BufferedReader(new java.io.FileReader(javaUrlToFilename(filePath)));
                    var line;
                    while((line = r.readLine()) != null)
                        content.push(new String(line));
                    r.close();
                } catch(ex) {
                    return null;
                }
                return content.join("\n") + "\n";
            },
            saveFile: function(filePath,content) {
                try {
                    var s = new java.io.PrintStream(new java.io.FileOutputStream(javaUrlToFilename(filePath)));
                    s.print(content);
                    s.close();
                } catch(ex) {
                    return null;
                }
                return true;
            }
        }

        // Private utilities

        function javaUrlToFilename(url) {
            var f = "//localhost";
            if(url.indexOf(f) == 0)
                    return url.substring(f.length);
            var i = url.indexOf(":");
            return i > 0 ? url.substring(i-1) : url;
        }

    })(jQuery);
</script>

<script type="text/javascript" id="js">
    $.tablesorter.addParser({
        id: "customDate",
        is: function(s) {
            return /\d{1,2}\.\d{1,2}\.\d{1,4} \d{1,2}:\d{1,2}:\d{1,2}/.test(s);
        },
        format: function(s) {
            s = s.replace(/\-/g," ");
            s = s.replace(/:/g," ");
            s = s.replace(/\./g," ");
            s = s.split(" ");
            return $.tablesorter.formatFloat(new Date(s[2], s[1]-1, s[0], s[3], s[4], s[5]).getTime());
                                           //Date(year, month, day, hours, minutes, seconds, milliseconds)
        },
        type: "numeric"
    });

    $(document).ready(function()
    {
        $("#myTable").tablesorter({
            headers: { 2: {sorter:'customDate'}, 3: {sorter:'customDate'}, 9: {sorter:'customDate'} },
            sortList: [[2,2]],
        });
        
		// display tooltip if the mouse is hovered on "view folder" link
        $(".viewfolder").hover(function() {
            $(this).attr('title', 'In Firefox --> Right-click + Open Link in External Application \n\nIn IE --> Left-click');
        });
    });

    function timedRefresh(whattd, numberoffiles) 
    {
        var timeoutPeriod = 0;
        var colorstr = '';
        
        if (whattd == "update")
        {
            timeoutPeriod=1000+50*numberoffiles;
            colorstr = "#bbbbbb";
        }
        if (whattd == "delete")
        {
            timeoutPeriod=1000+200*numberoffiles;
            colorstr = "#FF8000";
        }
        if (whattd == "archive")
        {
            timeoutPeriod=2000+1500*numberoffiles;
            colorstr = "#60bb00";
        }
        
        document.getElementById('Updatereminder').innerHTML = "<span style=\"padding: 5px 8px 6px 8px; border: 1px solid #ffffff; -moz-border-radius: 5px; -webkit-border-radius: 5px;border-radius: 5px;background-color: "+colorstr+"; margin: 10px; font-family:Arial; font-size:medium; font-weight:bold; color:white;  text-shadow: 0px 1px 1px rgba(0, 0, 0, .8);\">This page will reload automatically. If the started script does not finish in time, you will need to <em>reload manually</em> again.</span>";
        setTimeout("location.reload(true);",timeoutPeriod);
    }

</script>

<link rel="stylesheet" href="../Engine/htmldata/css/style.css" type="text/css" media="print, projection, screen" />
</head>

<body>
<div id="header">
<ul id="navlist">
<span style="margin: 50px; font-family:Arial; font-size:large; font-weight:bold; color:white;  text-shadow: 0px 2px 2px rgba(0, 0, 0, .8);">LIFT Testcase Report Overview</span>
<div id="Updatereminder"></div>
</ul>
</div>

<div id="content">

<form action="" id="reportselection">

<table id="myTable" class="tablesorter" style="font-family:helvetica,arial;font-size:small;"> 
<thead>
<tr> 
    <th>Filename</th>
    <th>Filename date</th>
    <th>(File date)</th>
    <th>Fail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>Inconc&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>None&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>Pass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>Total&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th>Action&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
</tr> 
</thead> 

<tbody> 
<TMPL_LOOP FILES>
<tr>
<TMPL_LOOP LINES><td><TMPL_VAR LINE></td></TMPL_LOOP>
</tr>
</TMPL_LOOP>
</tbody> 
<input type="hidden" name="selectit" value="Dont delete this, its needed for the javascript code to function properly.">
</table>

</form>

</div>
</body>
</html>

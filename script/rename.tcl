#!/usr/bin/tclsh
#
# Rename script, for Canon A80 and mobile phone photo file name
#
# argument 1: folder location (option)
#

package require jpeg

puts "##########   Start   ##########"
if {$argc >= 1} {
   cd [lindex $argv 0]
} elseif {$argc == 0} {
   cd "~/tmp"
}

foreach filename [glob *.jpg] {
   array set exif [::jpeg::getExif $filename]
   set today [clock format [clock scan $exif(DateTimeOriginal) \
                   -format {%Y:%m:%d %H:%M:%S}] -format %Y%m%d]

   set today2 $today
   append today2 "_"   

   regsub -all {\mIMG} $filename $today newFileName   
   regsub -all {\mCAM0} $filename $today2 newFileName
   file rename $filename $newFileName
}

puts "##########    End    ##########"
exit

#!/usr/bin/tclsh
#
# Rename script, for Canon A80 and mobile phone photo file name
#
# argument 1: folder location (option)
#

package require jpeg
package require Img
package require imgtools

puts "##########   Start   ##########"
if {$argc >= 1} {
   cd [lindex $argv 0]
} elseif {$argc == 0} {
   cd "~/tmp"
}

foreach filename [glob -nocomplain *.jpg] {
   array set exif [::jpeg::getExif $filename]
   set today [clock format [clock scan $exif(DateTimeOriginal) \
                   -format {%Y:%m:%d %H:%M:%S}] -format %Y%m%d]

   set today2 $today
   append today2 "_"   

   regsub -all {\mIMG} $filename $today newFileName
   regsub -all {\mCAM0} $filename $today2 newFileName
   regsub -all {\mIMAG} $filename $today2 newFileName
   file rename $filename $newFileName

   # For large image, resize to 1024x768 or 768x1024
   image create photo untiled -format JPEG -file $newFileName
   image create photo destImg

   set height [image height untiled]
   set width [image width untiled]
   if {$width == 4032} {
       ::imgtools::scale untiled 1024x768 destImg
       destImg write $newFileName -format JPEG
   } elseif {$height == 4032} {
       ::imgtools::scale untiled 768x1024 destImg
       destImg write $newFileName -format JPEG
   }

   image delete untiled destImg
}

puts "##########    End    ##########"
exit

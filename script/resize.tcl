package require Img
package require imgtools

if {$argc != 1} {
    retgurn
} else {
    set filename [lindex $argv 0]
}

image create photo untiled -format JPEG -file $filename
image create photo destImg

set height [image height untiled]
set width [image width untiled]
if {$width == 4032} {
    ::imgtools::scale untiled 1024x768 destImg
    destImg write $filename -format JPEG
} elseif {$height == 4032} {
    ::imgtools::scale untiled 768x1024 destImg
    destImg write $filename -format JPEG
}

exit

#!/usr/bin/tclsh
#
# Using libao and Opusfile to play stream
#

package require libao
package require opusfile
package require Tclx

if {$argc > 0} {
    set url [lindex $argv 0]
} else {
    puts "Please input URL."
    exit
}

set ctrlc_flag 0

proc mysig {} {
    global ctrlc_flag
    puts stdout "Aborting..."
    set ctrlc_flag 1
}

if {[catch {set data [opusfile url0 $url -isurl 1]}]} {
    puts "opusfile: open URL failed."
    exit
}

puts "Station Name: [dict get $data name]"
puts "Station Description: [dict get $data description]"
puts "Station Genre: [dict get $data genre]"
puts "Station URL: [dict get $data url]"
puts "Station Server: [dict get $data server]"

set bits [dict get $data bits]

libao::ao initialize
set id [libao::ao default_id]

set ctrlc_flag 0
signal trap SIGINT mysig

libao::ao open_live $id -bits $bits \
    -rate [dict get $data samplerate] \
    -channels [dict get $data channels]

while {[catch {set buffer [url0 read]}] == 0} {
    libao::ao play $buffer
    if {$ctrlc_flag==1} {
        break;
    }
}

url0 close
libao::ao close
libao::ao shutdown


#! /usr/bin/tclsh
#
# Source: 3D animation on canvas with Gnuplot
#         http://wiki.tcl.tk/13555
#
# gpanim.tcl 
# Author:      Gerard Sookahet
# Date:        14 Feb 2005 
# Description: Play animation on canvas thanks to Gnuplot
# Requirement: Gnuplot

package require Tk

bind all <Escape> {exit}

set gpexe gnuplot
# Give a full path to gpexe if your platform is windows
if {$::tcl_platform(platform) == "windows"} then {
  set gpexe C:/Prog/Graph/gnuplot-4.0/bin/pgnuplot.exe
}
set outfile [file dirname [info script]]/result.tk

pack [canvas .c -bg white]
pack [frame .f1 -relief sunken -bd 1] -fill x
pack [button .f1.br -text Replay -command {.c delete all;gnuplot .c}] \
     [label .f1.l1 -text "      Hit ESC to exit" -fg blue] -side left
.c create text 70 30 -text "Calling Gnuplot ...." -fill black -anchor w

set start {
    # Start the gnuplot session through a command pipeline channel
    set gp [open "|$gpexe" r+]
    puts $gp "set term tk"
    puts $gp "set output '$outfile'"
    puts $gp "set parametric"
    puts $gp "set hidden3d"
    puts $gp "set isosamples 18"
    puts $gp "set autoscale"
    puts $gp "set view 60,20"
    puts $gp "set urange \[-3:3\]"
    puts $gp "set vrange \[-3:3\]"
    puts $gp "set title \"Frame 0\" "
    puts $gp "splot u**3-3*u*v**2,3*u**2*v-v**3,u"
    set t [.c create text 70 50 -text "Processing frame 0" -fill black -anchor w]
    set k 0
    # Perform rotation around z-axis
    set i 40
    main $frames
}

set frames {
    incr k
    puts $gp "set view 60,$i"
    puts $gp "set title \"Frame $k\" "
    .c itemconfigure $t -text "Processing frame $k"
    puts $gp "replot"
    incr i 20
    if {$i <= 160} {
        set next $frames
    } else {
        close $gp
        .c create text 70 70 -text "Loading data" -fill black -anchor w
        set next $load
    }
    main $next
}

set load {
    set fp [open $outfile r]
       set data [read $fp]
    close $fp
    set data  [split $data "\n"]

    set j 0
    set k 6
    set n [llength $data]
    incr n -1

    set f1 [open $outfile w]
    foreach i [lrange $data 0 5] {puts $f1 $i}
    # modification of the output file
    for {set k 32} {$k <= $n} {incr k} {
       set i [lindex $data $k]
       if [string match "proc*" $i] {
         incr j
         puts $f1 "after 200"
         set i "# frame $j"
       } elseif [string match "set" $i] {
         set i "#"
       } elseif [string match "if" $i] {
         set i "#"
       } elseif [string equal "\}" $i] {
         set i "#"
         puts $f1 "update"
       }
       puts $f1 $i
    }
    puts $f1 "\}"
    flush $f1
    close $f1
    # Play the animation
    source $outfile
    gnuplot .c
}

proc main script {
    after 200 $script 
}

main $start

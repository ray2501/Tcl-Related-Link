#!/usr/bin/wish
grid [canvas .c -width 200 -height 200]
set PI      3.14159265
set halfpi  [expr 0.5 * $PI]
set piover6 [expr $PI/6]
set twopi   [expr 2 * $PI]

wm title . "clock"
wm attributes . -topmost 1 -alpha 0.9
wm resizable . 0 0

.c create oval 2 2 199 199 -fill white -outline black
for { set h 1 } { $h <= 12 } { incr h } {
    set angle [expr { $halfpi - $piover6 * $h }]
    set x [expr { 100 + 90 * cos($angle) }]
    set y [expr { 100 - 90 * sin($angle) }]
    .c create text $x $y -text $h -font {Helvetica -12}
}

proc hands {} {
    catch { .c delete withtag hands }

    # Compute seconds since midnight
    set s [expr { [clock seconds] - [clock scan 00:00:00] }]

    # Angle of second hand
    set angle [expr { $s * $::twopi / 60. }]
    set y [expr { 100 - 90 * cos($angle) }]
    set x [expr { 100 + 90 * sin($angle) }]
    .c create line 100 100 $x $y -width 1 -tags hands

    # Minute hand
    set angle [expr { $s * $::twopi / 60. / 60. }]
    set y [expr { 100 - 85 * cos($angle) }]
    set x [expr { 100 + 85 * sin($angle) }]
    .c create line 100 100 $x $y -width 3 -capstyle projecting -tags  hands

    # Hour hand
    set angle [expr { $s * $::twopi / 60. / 60. / 12. }]
    set y [expr { 100 - 60 * cos($angle) }]
    set x [expr { 100 + 60 * sin($angle) }]
    .c create line 100 100 $x $y -width 7 -capstyle projecting -tags hands

    after 1000 hands
}

hands

#!/usr/bin/tclsh
#
# Source: TkMC
#         http://wiki.tcl.tk/7772
#
#    TkMC clone of MC file manager.
#    Tested on MS Windows OS, it should be  work on any Unix systems
#    Author: Grigoriy Abramov
#    Date: January, 2002
#    comments,questions, bug reports send to:
#    gabramov@cpe.uchicago.edu
#    Packages:
#    Entry with History and File Properties dialog by Richard Suchenwirth 
#    Multiple scrollbars by Jeffrey Hobbs
#
#    TkMC - MC like file manager with basic functionality.
#
#    With TkMC you can browse,view, edit and run TCL application.
#    
#    DISCLAIMER and License Issues
#
#    TkMC - is copyrighted by Grigoriy Abramov 
#
#    This program is free software; you can redistribute it and/or modify it
#    without restriction.
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
#

package require Tk
global tcl_platform
if {$tcl_platform(platform) == "windows"} {
package require registry
package require opt
} else  {
package require opt    
}
wm resizable . 0 0
wm title . "TkMC v1.0" 
#Disable default Error messages
proc bgerror {errmsg} {
    global errorInfo errorCode
    set msg [format "Error: %s." $errmsg $errorCode]
    tk_messageBox -parent . -title  "Error" -type ok -icon error -message $msg   
}
#Proc centering windows
    proc center_win {w} {
    set x [expr [winfo rootx .]+250]
    set y [expr [winfo rooty .]+150]
    wm geometry $w "+$x+$y"
}
#Proc entry history
namespace eval history {
    proc add? {w} {
        variable $w
        variable n$w
        upvar 0 $w hist
        set s [set ::[$w cget -textvariable]]
        if {$s == ""} return
        if [string compare $s [lindex $hist end]] {
            lappend hist $s
            set n$w [llength $hist]
        }
    }
    proc move {w where} {
        variable $w
        variable n$w
        upvar 0 $w hist
        incr n$w $where
        if {[set n$w]<0} {set n$w 0}
        if {[set n$w]>=[llength $hist]+1} {
            set n$w [llength $hist]
        }
        set ::[$w cget -textvar] [lindex $hist [set n$w]]
    }
    proc for {type name args} {
        switch -- $type {
            entry {
                uplevel $type $name $args
                bind $name <Up> {history::move %W -1}
                bind $name <Down> {history::move %W 1}
                bind $name <Next> {history::move %W 99999}
                bind $name <Return> {history::add? %W}
                variable $name {}
                variable n$name 0
            }
            default {error "usage: history::for entry <w> <args>"}
        }
    }
 }



frame .top
frame .top.f -relief groove -bd 2
pack .top.f -fill x -expand true -side left
foreach x [file volume] {
    button .top.f.f$x -text [file native $x] -font {arial 8 {bold} } -relief groove -command ""
    pack .top.f.f$x -side left
    .top.f.f$x config -command "cd $x ; read_dir_l ; refresh_left" 
    
}
#Frame and entry areas for directory names
frame .top2
entry .top2.e_l -relief groove -bg grey80 -cursor arrow -font {arial 8 {bold}}
entry .top2.e_r -relief groove -bg grey80 -cursor arrow -font {arial 8 {bold}}
pack  .top2.e_l .top2.e_r -side left -fill x -expand true

#Fake entry (for some reason it should be exists to separate
#readings from dif directories
entry .fake_l
entry .fake_r
#pack .fake_l .fake_r -side top -fill x


#Buttons,entry, text,scrollbar for text on bottom
frame .bot -relief groove -bd 2
frame .bot.2 -relief groove -bd 2

pack .bot.2 -fill x
entry .bot.2.e_l -bg grey -relief groove -font {arial 8 {bold}}
entry .bot.2.e_r -bg grey -relief groove -font {arial 8 {bold}}
pack .bot.2.e_l .bot.2.e_r -side left -fill x -expand true
text .bot.t -wrap none  -height 10 -bg bisque -fg blue -font {monaco 12 {}} -cursor arrow -yscrollcommand [list .bot.scr set]
scrollbar .bot.scr -orient vertical -command [list .bot.t yview]
history::for entry .bot.comm -font {monaco 12} -bd 1 -bg bisque -cursor arrow -textvariable command_var
pack .bot.scr -side  right -fill y
pack .bot.t  .bot.comm -side top -fill x -expand true

bind .bot.comm <Return> {+ ; .bot.t delete 1.0 end ; \
            .bot.t insert end [exec_cmd [.bot.comm get]]; \
            .bot.comm delete 0 end  ; after 100 focus .bot.comm }
bind .bot.comm <Enter> {focus .bot.comm}        
foreach bot {.b1 .b2 .b3 .b4 .b5 .b6 .b7 .b8 .b9 .b10} {
    button .bot$bot -relief groove 
    pack .bot$bot -side left -fill x -expand true
}


.bot.b1 config -text "Help F1" -command About
.bot.b2 config -text "Menu F2" -command {}
.bot.b3 config -text "View F3" -command {}
.bot.b4 config -text "Editor F4" -command {editor}
.bot.b5 config -text "Copy F5" -command ""
.bot.b6 config -text "RenMv F6" -command ""
.bot.b7 config -text "MkDir F7"   -command ""
.bot.b8 config -text "Delete F8" -command ""
.bot.b9 config -text "Run Tcl Code F9" -command {focus .bot.t ; run_tcl .bot.t}
.bot.b10 config -text "Exit F10" -command exit
pack .bot -side bottom -fill both -expand true

#Right drive lists
frame .top.f_r -relief groove -bd 2
pack .top.f_r -fill x -expand true -fill x -side left 
foreach x [file volume] {
    button .top.f_r.f$x -text [file native $x] -font {arial 8 {bold} } -relief groove -command ""
    pack .top.f_r.f$x -side left
    .top.f_r.f$x config -command "cd $x ; read_dir_r ; refresh_right"
    
}

pack .top -side top -fill x -expand true
pack .top2 -side top -fill x -expand true
#Left listboxes
listbox .l    -bg bisque -width 20 -export no -bd 0 -relief raised -selectmode browse -yscrollcom LBscroll -font {monaco 10}
listbox .sz   -bg bisque -width 8 -export no -bd 0 -selectmode browse -yscrollcom LBscroll -font {monaco 10}
listbox .time -bg bisque -export no -width 15  -bd 0 -selectmode browse -yscrollcom LBscroll -font {monaco 10}
pack .l .sz .time -side left -fill both -expand true
#Right side listboxes
listbox .l_r -bg bisque -width 20 -export no -bd 0 -relief raised -selectmode browse -yscrollcom LBscroll_r -font {monaco 10}
listbox .sz_r  -bg bisque -width 8 -export no -bd 0 -selectmode browse -yscrollcom LBscroll_r -font {monaco 10}
listbox .time_r  -bg bisque  -export no -width 15  -bd 0 -selectmode browse -yscrollcom LBscroll_r -font {monaco 10}
pack .l_r .sz_r .time_r -side left -fill both -expand true
#Fill all listboxes 
proc read_dir_l {} {
#clean all listboxes
.l delete 0 end
.sz delete 0 end
.time delete 0 end
.l insert end ".."
.sz insert end ".."
.time insert end ".."
set dir   [glob -nocomplain ./*]
set files [glob -nocomplain ./*]
set dirs {}
set others {}
set dsize {}
set dtime {}
set fsize {}
set ftime {}
foreach f [lsort -dictionary $files] {
    if { ![file isdirectory $f] && ![file isfile $f] } {
        lappend others [file tail $f]
        lappend fsize "NOT A FILE"
        lappend ftime "------"
    } elseif [file isdirectory $f] {
        lappend dirs [file tail $f]
        lappend dsize "DIR"
        lappend dtime [clock format [file mtime $f] -format {%b-%d-%y %H:%M}]
    } else  {
       lappend others [file tail $f]
       lappend fsize [file size $f]
       lappend ftime [clock format [file mtime $f] -format {%b-%d-%y %H:%M}]
    }
}
    foreach f [concat $dirs $others]  {
            .l insert end $f
       }
    foreach z [concat $dsize $fsize] {
            .sz insert end $z
       }
    foreach t  [concat $dtime $ftime] {
       .time insert end $t 
       }
    .top2.e_l delete 0 end
    .top2.e_l insert end [file native [pwd]]
    .fake_l delete 0 end
    .fake_l insert end [pwd]
}
#Fill right listboxes
proc read_dir_r {} {
#clean all listboxes
.l_r delete 0 end
.sz_r delete 0 end
.time_r delete 0 end
.l_r insert end ".."
.sz_r insert end ".."
.time_r insert end ".."
set dir_r   [glob -nocomplain ./*]
set files_r [glob -nocomplain ./*]
set dirs_r   {}
set others_r {}
set dsize_r  {}
set dtime_r  {}
set fsize_r  {}
set ftime_r  {}
foreach f [lsort -dictionary $files_r] {
    if { ![file isdirectory $f] && ![file isfile $f] } {
        lappend others_r [file tail $f]
        lappend fsize_r "NOT A FILE"
        lappend ftime_r "------"
    } elseif [file isdirectory $f] {
        lappend dirs_r [file tail $f]
        lappend dsize_r "DIR"
        lappend dtime_r [clock format [file mtime $f] -format {%b-%d-%y %H:%M}]
    } else  {
       lappend others_r [file tail $f]
       lappend fsize_r [file size $f]
       lappend ftime_r [clock format [file mtime $f] -format {%b-%d-%y %H:%M}]
    }
}
    foreach f [concat $dirs_r $others_r]  {
            .l_r insert end $f
 }
    foreach z [concat $dsize_r $fsize_r] {
            .sz_r insert end $z    
}
    foreach t  [concat $dtime_r $ftime_r] {
       .time_r insert end $t    
    }
    
    .top2.e_r delete 0 end
    .top2.e_r insert end [file native [pwd]]
    .fake_r delete 0 end
    .fake_r insert end [pwd]
}


read_dir_l 
read_dir_r 

#Left scroolbar and procs to scroll
scrollbar .sy -orient v -command "LBset yview"
pack .sy -fill y -after .time -side left

proc LBset args {
    foreach lb {.l .sz .time} {
        eval $lb $args
    }
}
proc LBscroll args {
    eval .sy set $args
    LBset yview moveto [lindex $args 0]
}


foreach lb {.l .sz .time} {
     
    bind $lb <ButtonPress-1> {
        LBset select clear 0 end
        LBset select set [%W nearest %y]
        set show [.l curselection]
        .bot.2.e_l delete 0 end
        .bot.2.e_l insert end [.l get $show ] 
        
}
    bind $lb <B1-Motion> {
        LBset select clear 0 end
        LBset select set [%W nearest %y]
        LBset see [%W nearest %y]
        set show [.l curselection]
        .bot.2.e_l delete 0 end
        .bot.2.e_l insert end [.l get $show ] 
    }
    
    bind $lb <ButtonRelease-1> {
        LBset select clear 0 end
        LBset select set [%W nearest %y]
        set show [.l curselection]
        .bot.2.e_l delete 0 end
        .bot.2.e_l insert end [.l get $show ]      
   
}
}

#Right scroolbar and proc for scroll
scrollbar .sy_r -orient v -command "LBset_r yview"
pack .sy_r -fill y -after .time_r -side right

proc LBset_r args {
    foreach lb_r {.l_r .sz_r .time_r} {
        eval $lb_r $args
    }
}
proc LBscroll_r args  {
    eval .sy_r set $args 
    LBset_r yview moveto [lindex $args 0]
}


foreach lb_r {.l_r .sz_r .time_r} {
    bind $lb_r <ButtonPress-1> {
        LBset_r select clear 0 end
        LBset_r select set [%W nearest %y]
        set show [.l_r curselection]
        .bot.2.e_r delete 0 end
        .bot.2.e_r insert end [.l_r get $show ] 
    }
    bind $lb_r <B1-Motion> {
        LBset_r select clear 0 end
        LBset_r select set [%W nearest %y]
        LBset_r see [%W nearest %y]
         set show [.l_r curselection]
        .bot.2.e_r delete 0 end
        .bot.2.e_r insert end [.l_r get $show ] 
    }
    
    bind $lb_r <ButtonRelease-1> {
        LBset_r select clear 0 end
        LBset_r select set [%W nearest %y]
        set show [.l_r curselection]
        .bot.2.e_r delete 0 end
        .bot.2.e_r insert end [.l_r get $show ] 
    }
}

#Proc to show file names on bottom entry right and left
#Scroll selected lines in all listboxes in left

proc showItemDown {w w2} {
    set item [$w curselection]
    set item2 [expr $item+1]
    $w2 delete 0 end; 
    $w2 insert end [$w get $item2]
    foreach sel {.l .sz .time} {
    $sel selection clear $item
    $sel selection set $item2 ; $sel selection clear $item

}
}
proc showItemUp {w w2} {
    set item [$w curselection]
    set item2 [expr $item-1]
    $w2 delete 0 end; 
    $w2 insert end [$w get $item2]
     foreach sel {.l .sz .time} {
    $sel selection clear $item
    $sel selection set $item2 ; $sel selection clear $item
    

}
}

#Proc to scroll all selection in right side

proc showItemDown_r {w w2} {
    set item [$w curselection]
    set item2 [expr $item+1]
    $w2 delete 0 end; 
    $w2 insert end [$w get $item2]
    foreach sel {.l_r .sz_r .time_r} {
    $sel selection clear $item
    $sel selection set $item2 ; $sel selection clear $item

}
}
proc showItemUp_r {w w2} {
    set item [$w curselection]
    set item2 [expr $item-1]
    $w2 delete 0 end; 
    $w2 insert end [$w get $item2]
     foreach sel {.l_r .sz_r .time_r} {
    $sel selection clear $item
    $sel selection set $item2 ; $sel selection clear $item
    

}
}

proc edit_file {w} {
    global fileex
    set fileex  [$w get active]
    if [file isdirectory $fileex] {
       tk_messageBox -parent . -title  "Error" -type ok -icon error -message "This is directory" 
    } else  {
     editor
     set openfile [open $fileex "r"] 
    .ed.text.t delete 1.0 end
    .ed.text.t insert end [read $openfile]
    close $openfile
     }  
        
        
    }
    

#Proc to change left directory list
proc read_left {} {
    #focus .l
    global fileex
    set old_dir [.fake_l get]
    cd $old_dir
    set dir  [.l get active]
    if [file isdirectory $dir] {
    cd $dir ; read_dir_l
    .l selection set 0; .sz selection set 0; .time selection set 0
    .l activate 0
    .top2.e_l delete 0 end
    .top2.e_l insert end [file native [pwd]]
    
    } else  {
        
    set fileex  [.l get active]
    if [file executable $fileex] {
    catch {exec $fileex &} result
    #.bot.t insert end [eval exec command /c $fileex]
    
    }
    
    if {[id_giffile] == 1}  {
     img_view $fileex
    }
    if {[id_txtfile] == 1} {
    set openfile [open $fileex "r"] 
    .bot.t delete 1.0 end
    .bot.t insert end [read $openfile]
    close $openfile
    }
    if {[id_tclfile] == 1} {
        set dir [pwd]
        showTcl $dir/$fileex
    }
    if {[id_htmlfile] == 1} {
        set dir [pwd]
        showHtml $dir/$fileex
    }    
}
}


proc read_right {} {
# Get selected list item
    global fileex
    focus .l_r
    set old_dir [.fake_r get]
    cd $old_dir
    set dir_r  [.l_r get active]
    if [file isdirectory $dir_r] {
    cd $dir_r ; read_dir_r
    .l_r selection set 0; .sz_r selection set 0; .time_r selection set 0
    .top2.e_r delete 0 end
    .top2.e_r insert end [file native [pwd]]
    } else  {
    set fileex  [.l_r get active]
    if [file executable $fileex] {
         catch {exec $fileex &} result
    #.bot.t insert end [eval exec command /c $fileex] 
    
    }
    if {[id_giffile] == 1}  {
     img_view $fileex 
     }
    if {[id_txtfile] == 1} {
    set openfile [open $fileex "r"] 
    .bot.t delete 1.0 end
    .bot.t insert end [read $openfile]
    close $openfile
    }
    if {[id_tclfile] == 1} {
        set dir [pwd]
        showTcl $dir/$fileex
        }
    if {[id_htmlfile] == 1} {
        set dir [pwd]
        showHtml $dir/$fileex
    }
   
}
    
}
proc copy_file_to_r {} {
    set file_l  [.l get active]
    set left_dir [.fake_l get]
    set right_dir [.fake_r get]
    set choise [tk_messageBox -parent . -type yesno -default yes \
            -message "Copy\n [file native $left_dir/$file_l]\nto\n \
           [file native $right_dir]" \
                    -icon question]
        if {$choise == "yes"} {
    if [file isdirectory $file_l] {
         file copy -force $left_dir/$file_l $right_dir
            refresh_right ; refresh_left 
            cd [.fake_l get]
    } else  {
        file copy $left_dir/$file_l $right_dir
        after 100 refresh_left; refresh_right
        cd [.fake_l get]
    }
}
}
proc copy_file_to_l {} {
    set file_r [.l_r get active]
    set left_dir [.fake_l get]
    set right_dir [.fake_r get]
    set choise [tk_messageBox -parent . -type yesno -default yes \
            -message "Copy\n [file native $right_dir/$file_r] \nto\n \
            [file native $left_dir]" \
                    -icon question]
        if {$choise == "yes"} {
       if [file isdirectory $file_r] {
            file copy $right_dir/$file_r $left_dir;
            refresh_left ; refresh_right
            cd [.fake_r get] 
    } else  {
        file copy $right_dir/$file_r $left_dir
        refresh_left
        cd [.fake_r get]     
    }
}
}
#Rename move files and Directories
proc ren_move {w} {
    catch [destroy .move]
    toplevel .move
    wm resizable .move 0 0
    wm title .move "Rename"
    grab .move
    center_win .move
    global file_move
    set file_move [$w get active]
    label .move.l -text "Current name is: \n$file_move \n\n Enter new name:  " -relief groove -font {arial 8 {bold}}
    entry .move.e -font {arial 8 {bold}}
    .move.e insert end $file_move
    focus .move.e
    frame .move.ok -relief sunken -bd 2
    button .move.ok.ok -text "  Ok  " -padx 10 -pady 5 -command {file rename $file_move [.move.e get]; \
    after 1 "refresh_right; refresh_left; destroy .move"}
    button .move.cancel -text Cancel -command "destroy .move"
    pack .move.l .move.e  -side top -fill x -expand true
    pack .move.ok .move.ok.ok .move.cancel -side left -padx 10 -pady 5
    bind .move.e <Return> {file rename $file_move [.move.e get]; \
    after 30 refresh_right; refresh_left; after 35 destroy .move }    
        }
        
proc delete_file_l {} {
    set file_l    [.l get active]
    set left_dir  [.fake_l get]
    if [file isdirectory $file_l] {
    set cur [.l curselection]
        set question [tk_messageBox -type okcancel -default cancel \
        -message "   Delete directory and files in \n   [file native $left_dir/$file_l]" \
        -icon question]
        switch -- $question {
            ok  { file delete -force $file_l ; refresh_left ; refresh_right}
                  
            }
} else  {
            set cur [.l curselection]
            set question [tk_messageBox -type okcancel -default cancel \
        -message "   Delete files \n  [file native $left_dir/$file_l]" \
        -icon question]
        switch -- $question {
            ok  { file delete $left_dir/$file_l; refresh_left; refresh_right}
                   
            
            }
       
        #.l selection set $curent
        #.l see $curent
        
    }
}
proc delete_file_r {} {
    set file_r  [.l_r get active]
    set right_dir [.fake_r get]
    if [file isdirectory $file_r] {
        set curent [.l_r curselection]
        set question [tk_messageBox -type okcancel -default cancel \
        -message "   Delete directory and files in \n   [file native $right_dir/$file_r] " \
        -icon question]
        switch -- $question {
            ok  { file delete -force $file_r ;
                   refresh_left ; refresh_right }
            }

    } else  {
        set curent [.l_r curselection]
        set question [tk_messageBox -type okcancel -default cancel \
        -message "   Delete files \n [file native $right_dir/$file_r]" \
        -icon question]
        switch -- $question {
            ok  {  file delete $right_dir/$file_r;
                   refresh_right; refresh_left }
            
        }
     
    }
}

proc mk_dir {w} {
    catch [destroy .mkdir]
    toplevel .mkdir
    wm resizable .mkdir 0 0
    wm title .mkdir "Create new Directory"
    grab .mkdir
    center_win .mkdir
    label .mkdir.l -text "  Current directory is: \n[file native [pwd]] \n\n Enter new directory name   " -relief groove -font {arial 8 {bold}}
    entry .mkdir.e -font {arial 8 {bold}}
    focus .mkdir.e
    frame .mkdir.ok -relief sunken -bd 2
    button .mkdir.ok.ok -text "  Ok  " -padx 10 -pady 5 -command {file mkdir [.mkdir.e get]; \
    after 1 "refresh_right; refresh_left; destroy .mkdir"}
    button .mkdir.cancel -text Cancel -command "destroy .mkdir"
    pack .mkdir.l .mkdir.e  -side top -fill x -expand true
    pack .mkdir.ok .mkdir.ok.ok .mkdir.cancel -side left -padx 10 -pady 5
    bind .mkdir.e <Return> {file mkdir [.mkdir.e get]; \
    after 30 refresh_right; refresh_left; after 35 destroy .mkdir }
}
#end mk_dir
proc find_win {w} {

catch [destroy .find]
        toplevel .find
        center_win .find
        wm title .find "Find"
        wm resizable .find 0 0
        grab .find
        label .find.l -text "\tCurrent directory is:\t\n\t[file native [pwd]]\t\t\n\nSearch Filename:" -relief groove -font {arial 10 {bold}}
        entry .find.e
        pack .find.l .find.e -fill x
        focus .find.e
        frame .find.ok -relief sunken -bd 1
        button .find.ok.ok -padx 10 -pady 5 -text Find \
                -command {.bot.t delete 1.0 end ; find_file [pwd] [.find.e get] ; \
                destroy .find}
        button .find.cancel -text Cancel -command "destroy .find"
        pack .find.ok .find.ok.ok .find.cancel -side left -padx 10 -pady 5
    }
#Proc find file
    proc find_file { startDir namePat} {
        #set namePat [.find.e get]
        set pwd [pwd]
        if [catch {cd $startDir} err] {
            puts stderr $err
            return
        }
        foreach match [glob -nocomplain -- $namePat] {
            
            .bot.t insert end "[file native $startDir/$match]\n"
            if {$namePat != $match } {
               #.bot.t insert end "$startDir$match\n" 
            #.bot.t insert end "no match"
        } else {
               #.bot.t insert end "no files found" 
            }
            
        }
        foreach file [glob -nocomplain *] {
            if [file isdirectory $file] {
                find_file $startDir/$file $namePat
                update
            }
        
    }
        cd $pwd
    


}
    
#Refresh left listbox after copy or deleting a file
proc refresh_left {} {
        set left_dir  [.fake_l get]
        set cur [.l curselection]
        if {$cur == "" } {
            focus .l
    after 3 ".l selection set 0 ; .sz selection set 0 ; .time selection set 0"
    .l see 0
    .l activate 0
      
    } else  {
     cd $left_dir ; read_dir_l
    .l selection set $cur ; .sz selection set $cur ; .time selection set $cur
    .l see $cur
    .l activate $cur
    .top2.e_l delete 0 end
    .bot.2.e_l delete 0 end
    .top2.e_l insert end [file native [pwd]]
    }
}
refresh_left

proc refresh_right {} {
     set right_dir [.fake_r get]
     set cur [.l_r curselection]   
     if {$cur == ""} {
        .l_r selection set 0 ; .sz_r selection set 0; .time_r selection set 0
        .l_r see 0
        .l_r activate 0
    } else  {   
        cd $right_dir ; read_dir_r
    .l_r selection set $cur; .sz_r selection set $cur; .time_r selection set $cur
    .l_r see $cur
    .l_r activate $cur
    .top2.e_r delete 0 end
    .bot.2.e_r delete 0 end
    .top2.e_r insert end [file native [pwd]]
}
}
proc viewFile {w} {
    #global fileex
    set fileex [$w get active]
       if [file isdirectory $fileex] {
       tk_messageBox -parent . -title  "Error" -type ok -icon error -message "This is directory" 
    } else  { 
     set openfile [open $fileex "r"] 
    .bot.t delete 1.0 end
    .bot.t insert end [read $openfile]
    close $openfile

}
}
refresh_right

#Bindings global
#bind .bot.t <Enter> "focus .bot.t"
bind . <F4> "editor"
bind . <F9> {focus .bot.t ; run_tcl .bot.t}

#Bindings keys for left side
foreach bind_left { .l .sz .time} {
    bind $bind_left <Enter>  {focus .l ; set old_dir [.fake_l get] ; cd $old_dir ; \
     .bot.b2 config -command {}; \
     .bot.b3 config -command {viewFile .l} ; \
     .bot.b5 config -command copy_file_to_r ; \
     .bot.b6 config -command {ren_move .l} ; \
     .bot.b7 config -command {mk_dir .l} ; \
     .bot.b8 config -command delete_file_l}
            
}

bind .l   <Double-Button-1> "read_left;"
bind .l   <Return> {read_left}
bind .l <Down> {showItemDown .l .bot.2.e_l}
bind .l <Up>   {showItemUp .l .bot.2.e_l}
bind .l <KeyPress-r> "focus .l_r"
bind .l <F3> {viewFile .l}
bind .l <F5> copy_file_to_r
bind .l <F6> {ren_move .l}
bind .l <F7> {mk_dir .l}
bind .l <F8> delete_file_l
#Bindings keys for right side
bind .l_r <Double-Button-1> "read_right"
bind .l_r <Return> {read_right}
foreach bind_right {.l_r .sz_r .time_r} {
bind $bind_right  <Enter> {focus .l_r;  set old_dir [.fake_r get] ; cd $old_dir ; \
            .bot.b3 config -command {viewFile .l_r}; \
            .bot.b8 config -command delete_file_r; \
            .bot.b5 config -command copy_file_to_l ; \
            .bot.b6 config -command {ren_move .l_r} ; \
            .bot.b7 config -command {mk_dir .l_r}}
    }
bind .l_r <KeyPress-r> "focus .l"
bind .l_r <F3> {viewFile .l_r}
bind .l_r <F5> copy_file_to_l
bind .l_r <F6> {ren_move .l_r}
bind .l_r <F7> {mk_dir .l_r}
bind .l_r <F8> delete_file_r
bind .l_r <Down> {showItemDown_r .l_r .bot.2.e_r}
bind .l_r <Up> {showItemUp_r .l_r .bot.2.e_r}
#Txt, ASCII and bat files  viewer 
proc id_allfiles {} {
    global fileex
        set ext_txt [file extension $fileex]
        switch $ext_txt {
            .doc  {return 1}
            .txt  {return 1}
            .jpeg  {return 1}
            .jpg  {return 1}
            .txt    {return 1}
             .htm     {return 1}
            .html    {return 1}
                    
         }
        return 0
        
}
proc id_txtfile {} {
        global fileex
        set ext_txt [file extension $fileex]
        switch $ext_txt {
            .txt  {return 1}
            .TXT  {return 1}
            .bat  {return 1}
            .BAT  {return 1}
            .c    {return 1}
            .C    {return 1}
            .h    {return 1}
            .H    {return 1}
                    
         }
        return 0
    }
    
 proc id_tclfile {} {
        global fileex
        set ext_tcl [file extension $fileex]
        switch $ext_tcl {
            .tcl  {return 1}
            .TCL  {return 1}
            .tk  {return 1}
            .TK  {return 1}
        }
        return 0
    }
       
proc id_giffile {} {
        global fileex
        set ext_gif [file extension $fileex]
        switch $ext_gif {
            .gif  {return 1}
            .GIF  {return 1}
            .jpeg {return 1}
            .jpg  {return 1}
            .JPEG {return 1}
            .JPG  {return 1}
            .tif  {return 1}
        }
        return 0
    }

proc id_htmlfile {} {
        global fileex
        set ext_html [file extension $fileex]
        switch $ext_html {
            .htm  {return 1}
            .html  {return 1}
            .HTM {return 1}
            .HTML  {return 1}
            
              
        }
        return 0
    }
#Proc file atributes and properties
proc fileprop pathname {
    set padx 6
    if {$pathname=="."} {set pathname [pwd]}
    set pathname [file join [pwd] $pathname]
    set checkbuttons [list]
    file stat $pathname a ;# may error out if no such file
    set w .[clock clicks]
    set ::$w\(dir) [file dir $pathname]
    set ::$w\(file) [file tail $pathname]
    toplevel $w
    grab $w
     
    wm title $w [file nativename $pathname]
    wm resizable $w 0 0
    wm geometry $w +300+150
    set size [file size $pathname]
     if {$size < 0} {
        set size [format "%2.2f GB" [expr ($size/-1024.0)/-1024.0/-1024.0*10.0]]
    } else  {
     if {$size > 1073741824.0} {
        set size [format "%2.2f GB" [expr ($size/1024.0)/1024.0/1024.0]]
    } else  {
        
    
    if { $size > 1048576.0 } {
        set size [format "%2.2f MB" [expr ($size/1024.0) /1024.0 ]]
    } else  {
        
    
    if {$size > 1024} {
        set size [ format "%2.2f KB" [expr $size / 1024.0 ]]
    }
}
}
}
set textual [list Name [file tail $pathname]  \
        Directory [file nativename [file dir $pathname]] \
        Type [file type $pathname]\
        Size $size \
        Created [date,time $a(ctime)]\
        "Last modified" [date,time $a(mtime)]\
        "Last accessed" [date,time $a(atime)]\
            ]
            
    foreach {name value} [file attr $pathname] {
        if [regexp {^[01]$} $value] {
            lappend checkbuttons $name $value
        } else {
            lappend textual  $name [file nativename $value]
        }
    }
    set n 0
    foreach {name value} $textual {
        grid [label $w.${n}n -text $name:] [label $w.${n}v -text $value]\
                -sticky w -padx $padx
        incr n
    }
    grid [hr $w.$n]  -sticky we -columnspan 2 -padx $padx -pady 6
    set n0 [incr n]
    foreach {name value} $checkbuttons {
        incr n
        set ::$w\($name) $value
        grid [checkbutton $w.$n -text $name -var $w\($name) -borderwidth 0]\
                -sticky w -col 1 -padx $padx
    }
    grid [label $w.att -text Attributes:]\
            -row $n0 -sticky w -padx $padx
    grid [hbuttons $w.b [list \
            OK     "fileprop:apply $w;  destroy $w; unset $w" \
            Cancel "destroy $w; unset $w" \
            Apply  "fileprop:apply $w" \
            ]] -col 1 -padx $padx
    wm protocol $w WM_DELETE_WINDOW "destroy $w; unset $w"
    focus $w
}
proc fileprop:apply {w} {
    upvar #0 $w a
    set cmd [list file attributes [file join $a(dir) $a(file)]]
    foreach {name value} [array get a] {
        if [regexp {^-} $name] {lappend cmd $name $value}
    }
    eval $cmd
}
proc hbuttons {w tc} {
    frame $w
    set n 1
    foreach {t c} $tc {
        button $w.$n -text $t -command $c -width 8
        incr n
    }
    eval pack [winfo children $w] -side left -padx 3 -pady 6\
            -fill x -anchor e
    return $w
}
proc hr {w} {frame $w -height 2 -borderwidth 1 -relief sunken}
proc date,time {{when {}}} {
    if {$when == ""} {set when [clock seconds]}
    return [clock format $when -format "%Y-%m-%d,%H:%M:%S"]
 
}

#Proc popup menus

proc pop_upmen_l {w} {
    global act
    set act [$w curselection]
         
    menu .popup_l -tearoff 0
    .popup_l add separator
    .popup_l add command -label Info -command  {fileprop [.bot.2.e_l get]}
    .popup_l add separator
    .popup_l add command -label View -command   "viewFile .l"
    .popup_l add command -label Edit -command   "edit_file .l"
    .popup_l add separator
    .popup_l add command -label Find -command  {find_win .l}
    .popup_l add command -label Copy   -command copy_file_to_r
    .popup_l add command -label NewDir   -command "mk_dir .l"
    .popup_l add separator
    .popup_l add command -label Rename -command "ren_move .l"
    .popup_l add command -label Delete -command delete_file_l
    .popup_l add separator
bind $w <ButtonPress-3>  {tk_popup .popup_l %X %Y  }


}
proc pop_upmen_r {w} {
    global act
     set act [$w curselection]
    menu .popup_r -tearoff 0
    .popup_r add separator
    .popup_r add command -label Info -command  {fileprop [.bot.2.e_r get]}
    .popup_r add separator
    .popup_r add command -label View -command   "viewFile .l_r"
    .popup_r add command -label Edit -command   "edit_file .l_r"
    .popup_r add separator
    .popup_r add command -label Find -command  {find_win .r}
    .popup_r add command -label Copy   -command copy_file_to_l
    .popup_r add command -label NewDir   -command "mk_dir .l_r"
    .popup_r add separator
    .popup_r add command -label Rename -command "ren_move .l_r"
    .popup_r add command -label Delete -command delete_file_r
    .popup_r add separator
bind $w <ButtonPress-3>  {tk_popup .popup_r %X %Y  }
}

pop_upmen_l .l 
pop_upmen_r .l_r
#Image viewer procs
#Var set
set i 1
set im 1
#image viewer procedure
proc img_view {fileex} {
global i
global im
incr i
incr im
toplevel .img$i
wm title .img$i $fileex
#wm minsize .img$i 800 640
image create photo $im
$im read $fileex
set im_y [image height $im]
set im_x [image width $im]
wm minsize .img$i 200 100
canvas .img$i.c -relief groove -bd 2 -scrollregion {0 0 3000 3000} \
        -yscrollcommand [list .img$i.scr set] \
        -xscrollcommand [list .img$i.xscr set]
scrollbar .img$i.scr -orient vertical -command [list .img$i.c yview]
scrollbar .img$i.xscr -orient horizontal -command [list .img$i.c xview]
.img$i.c create image 5 5 -image $im -anchor nw 
update
pack .img$i.scr -side right -fill y
pack .img$i.xscr -side bottom -fill x
pack .img$i.c -side left  -fill both -expand true
}
#Procedure to run command from entry
proc exec_cmd {command} {
global tcl_platform
set result " "
set check_cmd [lindex $command 0] 
set cmd [info commands $check_cmd]
if {[string length $cmd ] > 0} {
    .bot.t insert end [set result [eval $command]]
    refresh_left
    #refresh_right    
    } else  {
    if {$tcl_platform(platform) == "windows"} {
    eval exec command /c [.bot.comm get]
    } else {
    eval exec [.bot.comm get] 
}
}
}
#Procedure for running tcl from text widgets
proc run_tcl {w} {
        if {[interp exists eval_env]}  {
        interp delete eval_env
        run_tcl $w     
    } else  {
    interp create eval_env
    load {} Tk eval_env
    set all [$w get 1.0 end]
    eval_env eval $all
       
    }
}


#Registry procedure
#Evaluate file extensions and execute applcation
::tcl::OptProc perSub {
    {string  -string "" "String to work on"}
    {pattern -string "" "What to substitute for, e.g., %v"}
    {subst   -string "" "What to put in for $pattern"}
    {args    -list   {} "More pattern/subst pairs"}
} {
    # Add the required instances to the optional list
    set args [linsert $args 0 $pattern $subst]

    # Process the list
    foreach {pattern subst} $args {
        # Validate pattern
        if { ! [string match %* $pattern]} {
            error "Bad pattern <<$pattern>>: Should be %something"
        }

        # Escape dangerous characters ('\' and '&') in substitution string
        regsub -all {\\|&} $subst {\\\0} subst

        # Do substitutions on string
        regsub -all $pattern $string $subst string
    }
    # foreach

    return $string
}

proc showHtml  {htmlFile} {
    global tcl_platform
    if {$tcl_platform(platform) == "windows"} {
    set root HKEY_CLASSES_ROOT
    set appKey [registry get $root\\.html ""]
    set appCmd [registry get \
            $root\\$appKey\\shell\\open\\command ""]
            set appCmd [perSub $appCmd %1 $htmlFile]
            regsub -all {\\} $appCmd {\\\\} appCmd
            eval exec $appCmd &
} else  {
    
}
}
proc showTcl {tclFile} {
    global tcl_platform
    if {$tcl_platform(platform) == "windows"} {
    set root HKEY_CLASSES_ROOT
    set appKey [registry get $root\\.tcl ""]
    set appCmd [registry get \
            $root\\$appKey\\shell\\open\\command ""]
            set appCmd [perSub $appCmd %1 $tclFile]
            regsub -all {\\} $appCmd {\\\\} appCmd
            eval exec $appCmd &
} else  {
    
}
}
proc editor {} {
catch [destroy .ed]
toplevel .ed
wm resizable .ed 0 0
wm title .ed "TclMC Editor"
menu .ed.menubar -relief raised -borderwidth 1
menu .ed.menubar.file -tearoff 0
 .ed.menubar add cascade -label "File" -menu .ed.menubar.file -underline 0
.ed.menubar.file add separator
.ed.menubar.file add command -label "New" -command {clear_all .ed.text.t}
.ed.menubar.file add separator
.ed.menubar.file add command -label "Open" \
-command {clear_all .ed.text.t ; textOpen}

.ed.menubar.file add separator
.ed.menubar.file add command -label "Close" \
-command {clear_all .ed.text.t}


.ed.menubar.file add separator
.ed.menubar.file add command -label "Save as..." \
-command {textSaveAs}

.ed.menubar.file add separator
.ed.menubar.file add command -label "Print" \
    -command {printFormat}

.ed.menubar.file add separator
.ed.menubar.file add command -label "Exit" \
-command {bell ; prompt_close .}
.ed.menubar add cascade -label "Edit" -menu .ed.menubar.editt -underline 0
menu .ed.menubar.editt -tearoff 0
.ed.menubar.editt add separator
.ed.menubar.editt add command -label "Select All" -command {.ed.text.t tag add sel 1.0 end}
.ed.menubar.editt add separator
.ed.menubar.editt add command -label "Copy" -command {tk_textCopy .ed.text.t}
.ed.menubar.editt add separator
.ed.menubar.editt add command -label "Paste" -command "tk_textPaste .ed.text.t"
.ed.menubar.editt add separator
.ed.menubar.editt add command -label "Cut" -command "tk_textCut .ed.text.t"
.ed.menubar.editt add separator
.ed.menubar.editt add command -label "Clear" -command "clear_all .ed.text.t"
.ed.menubar.editt add separator
.ed.menubar add cascade -label "Test Tcl" -menu .ed.menubar.run -underline 0
menu .ed.menubar.run -tearoff 0
.ed.menubar.run add separator
.ed.menubar.run add command -label "Run Tcl" -command {run_tcl .ed.text.t}
.ed.menubar.run add separator
.ed.menubar add cascade -label "Font Size" -menu .ed.menubar.font -underline 0
menu .ed.menubar.font -tearoff 0
.ed.menubar.font add separator
.ed.menubar.font add command  -label "Small" -command ".ed.text.t config -font {Monaco 8 {}}" 
.ed.menubar.font add separator
.ed.menubar.font add command  -label "Medium" -command ".ed.text.t config -font {Monaco 9 {}}" 
.ed.menubar.font add separator
.ed.menubar.font add command  -label "Large" -command ".ed.text.t config -font {Monaco 12 {}}" 

.ed.menubar add cascade -label "Help" -menu .ed.menubar.help -underline 0
menu .ed.menubar.help -tearoff 0
.ed.menubar.help add separator
.ed.menubar.help add command -label "Help" -command {About}
.ed.menubar.help add separator
.ed.menubar.help add command -label "About" -command {About}

.ed conf -menu .ed.menubar

proc clear_all { widgetname } {
$widgetname delete 1.0 end
}




proc textOpen { { fn ""} } {
    global .ed.text.t
    set types {
        {{All Files}    *}
        {{Text Files}   {.txt}}
        
        
    }
    if {
        [string match {} $fn] &&
        ([catch {tk_getOpenFile -filetypes $types \
            -title "Source File" -parent .ed} fn] || [string match {} $fn])
    } { return }
    set fp [open $fn]
    while {![eof $fp]} {
    
    .ed.text.t insert end [read $fp]
}
close $fp
}

# Handles window manager Close choice.

proc prompt_close { widgetname } {

    # If main window, prompt.
    if { $widgetname == "." } {
        set result [tk_messageBox -parent .ed \
                -title {Exit?} -type yesno\
                -icon warning \
                -message "Do you really want to quit?"]

        if { $result == "yes" } {
            destroy .ed
        }
    } else {
        # Not the main window, destroy it.
        destroy $widgetname
    }

}

wm protocol . WM_DELETE_WINDOW "prompt_close .ed"


#save as command
proc textSaveAs {} {
    global .ed.text.t
        set types {
            {{Tcl Files}        {.tcl}}
            {{Text Files}       {.txt}}
            {{All Files}        *}
            
        }
        set filename [tk_getSaveFile -title "Save as..." -filetypes $types]
    if {$filename !=""} {
    set file_open [open $filename w]
    puts -nonewline $file_open [.ed.text.t get 1.0 end] 
    close $file_open
    refresh_left
    refresh_right
    }
    
}
#Print using ms Write application
proc printFormat {} {
    global tcl_platform
    if {$tcl_platform(platform) == "unix"} {
    }     
if {[file exists c:/windows/write.exe]} {
set file [open c:/tmp/out.txt w]
puts $file [.ed.text.t get 1.0 end]
close $file
exec start /m write /p c:/tmp/out.txt &
} else {

if {[file exists c:/progra~1/accessories/wordpad.exe]} {
set file [open c:/tmp/out.txt w]
puts $file [.ed.text.t get 1.0 end]
close $file
exec start /m c:/progra~1/accessories/wordpad.exe /p c:/tmp/out.txt &
} else {

if {[file exists c:/winnt/system32/write.exe]} {
set file [open c:/tmp/out.txt w]
puts $file [.ed.text.t get 1.0 end]
close $file
exec c:/winnt/system32/write.exe /p c:/tmp/out.txt &

} else {
##
catch [destroy .formated]
toplevel .formated
wm title .formated ""
wm resizable .formated 0 0
label .formated.l -text "You need install MS Windows \n
WordPad application!\n
Press Ok button to continue" \
-relief groove
button .formated.b -text Ok -command "destroy .formated"
pack .formated.l -side top
pack .formated.b -side bottom

           }
          }
        }
}
#Image Buttons
set imnew {
R0lGODlhEAAQAPcAAAAAAMbGxv//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////yH5BAEAAAEALAAAAAAQABAA
AAhJAAMIHEiwIEEACBMiNCgQwL+HEBcadAjxoUMAEytaTFiQokaLHT9GDCnyH8aDJU2SFHlyoMeP
LRumjBngpUaaCnNKZMizJ8+AAAA7
}


#End New
#Open button image
set imopen {
R0lGODlhEAAPAPcAAAAAAMbGxv//AP//////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////yH5BAEAAAEALAAAAAAQAA8A
AAhMAAMIHEiwoMGDCBMSBMBQoUAAAv4JYEix4UKJAiJq/AegIESJIDV2vCiyoskAHydmXMmyIwCJ
EFm2fKhS5sqRKGPanLjQ5EmHQIMGBAA7
}
#End open image
#Save Image
set imsave {
R0lGODlhEAAQAPcAAAAAAAAAnAAA/8bGxs7Ozv//////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////yH5BAEAAAMALAAAAAAQABAA
AAhhAAcIHEiwoMGDBgEEECAAgMOHAgIAGKiQIYGLAQIQiDhRYEUBFwlk3CiR4sKGDx1yNMmwpcuG
JlPKdBjzn82b/x7WxGlTp0eJPHvS/AkgaM6hAxQWDeozqUOjTWdKRUg1IAA7
}

#End Save Image
#image Select all
set imselectall {
R0lGODdhFAARAPcAAAAAALa2qtu2qrbbqtvbqrOzs7a2/9u2/7bb/9vb/////wBMWTQJAAAAAAAA
AAAAAKgF9xcAABwANAkFAAAApG0/A1r4AgBk6wIACAAjAacrAAABAMk7AAAFAOA/AAAAAAAAAAAA
AEAGAAAAAAAA9wPWFE4ifwMJAAAA1hRa+AIAkOwCAAAyVwQBAA5gAAAAAAAAVuvHMaj4twVQUiAD
WAJABgEQAAAAAEAGAAAAAAAAAAAAABMBCeAABDAA1hQfBR8DWAUfAwAAAAACAOrrAgAIAB8BpysA
AAEANQIBAQYAAQAAANYUZAAAAAIANQIAAC8AFAAaAFYAJwBlAAAAAAAAQPdeAAC3BSHsAAAAAAAA
AADHMQAAAADc68cxqPi3BUIAnhcEAMjsxzEGAAEAJQAfAHoCSezg60nsTiOvBwgD3xOPEwwFSO0a
AC8A///3/wAACAPfE8cDAAD//wAAHwAgAPLrCiavBxjsxzF6At8TUezHMeDsJwHXExjsxzGLax8B
jxPg7EsB1xPc7McxSO3HMRjsxzEBAACAQXBwRXZlbnRzXFNjaGVtZXNcQXBwc1wuRGVmYXVsdFxN
QUdJQ01lbnVDb21tYW5kXC5DdXJyZW50AAngAACDAP4ABgG3BbDsS3tXBKj4twVwLtcFIQDwAAEA
BgAfAEMBAAAAACYAHwAAANYUBQDEFvcXWvisAx8DhAxDAR8AJgAlACcAHwAmACUAJwAAAK41AADE
Na41jwcfAgAAAADHAP1VrjUCAAAAAgCvNQDzrjUGGwcL4uzAHZUG9xf7Bq41AABI7boAAAA27TgC
SO3HMfTsxzEbA98TAACuNU1BR0lDTWVudUNvbW1hbmQAAwAAQO0tJG8YAAD+////BRAczyRFAgDH
MSRFAgDC7gIAiwAAANYUDQBO9wAAACAFANztnQOTAAEQSO3HMQwF9xcAAAD///8FEBzPFAIkRQIA
VAAM7hQL9zUAAP7///8FEBzPFAIQAhIAAAB+7RkAQwEYABkAPwwvASwAAAAAFAARAAAIiwALCBxI
sKDBgwgPAlioQMFChg4XGgQQoKKAigEEXKwIYCLGjRk1ZuxYUMGAAwMMnEyZkkABBQYVJAgwsybN
mzALUrRYcQDIACQJAkAgAEEAokaTAp04M6kAA0eLCgg6UAHGq1hzErQasifIAVoH7sz4kSdVgQCa
RoVKFOrZAg8bPgQgV2LCu3jzBgQAOw==

}


#end image Select all
#Copy Image
set imcopy {
R0lGODlhEAAQAPcAAAAAAM7Ozv//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////yH5BAEAAAEALAAAAAAQABAA
AAhSAAEIHEhwYICDAP4pXMjwH4CDARISbOgQokSBFCsidDiQ4sONFxNyLChSoUiMDFGmdNhQpcmX
KUuOdMlxoUyPJW+2zJnRJs+eM2m2hBiRZMGAAAA7
}

#End Copy Image
#Image Cut
set imcut {
R0lGODlhEAAQAPcAAAAAAMbGxv//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////yH5BAEAAAEALAAAAAAQABAA
AAhEAAMIHCgQAMGDCA0iXBhAocB/DhMOhMiw4MOICw1SrFhwI8eGGAcCGEnSI8GIJBk6VBhS5EiX
LSU2/DizJkeWNEEeDAgAOw==
}
#End Image Cut
#Image Paste
set impaste {
R0lGODlhEAAQAPcAAAAAAAAAY2NjY8bGxv//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////yH5BAEAAAMALAAAAAAQABAA
AAhgAAcIHEiwoMEBABICOIhQIQABAhwuFAjgn8WHCSNa/DexIkeIIDVypHhRYsKLJDeqVNlxZYCX
MF+m3BjAZYCZFmuqrHnTI81/MIHK9JlzZU6ENmPypOhQp8uDSmMyZBgQADs=
}

#End Image Past
#Image Ptint
set imprint {
R0lGODdhEwATAPcAAAAAAP8AAABtAACSAG1tVZJtVW2SVZKSVW1tqpJtqm2SqpKSqra2qtu2qrbb
qtvbqrOzs7a2/7bb/9v//////20/Azb1AgBk6wIACAD/AacrAAABAMk7AADzAuA/AAAAAAAAAAAA
AEAGAAAAAAAA9wPWFE4ifwMJAAAA1hQ29QIAkOwCAAAyVwQBAA5gAAAAAAAAVuvHMYT1twVQUiAD
WAJABgEQAAAAAEAGAAAAAAAAAAAAABMBCeAABDAA1hQfBR8DWAUfAwAAAAACAOrrAgAIAB8BpysA
AAEANQIBAQYAAQAAANYUZAAAAAIANQIAAC8AFAAaAFYAJwBlAAAAAAAAQPdeAAC3BSHsAAAAAAAA
AADHMQAAAADc68cxhPW3BUIAnhcEAMjsxzEGAAEAJQAfAHoCSezg60nsTiOvBwgD3xOPEwwFSO0a
AC8A///3/wAACAPfE8cDAAD//wAAHwAgAPLrCiavBxjsxzF6At8TUezHMeDsJwHXExjsxzGLax8B
jxPg7EsB1xPc7McxSO3HMRjsxzEBAACAQXBwRXZlbnRzXFNjaGVtZXNcQXBwc1wuRGVmYXVsdFxN
QUdJQ01lbnVDb21tYW5kXC5DdXJyZW50AAngAACDAP4ABgG3BbDsS3tXBIT1twVwLtcFIQDwAAEA
BgAfAEMBAAAAACYAHwAAANYUBQDEFvcXNvWsAx8DRAhDAR8AJgAlACcAHwAmACUAJwAAAK41AADE
Na41jwcfAgAAAADHAP1VrjUCAAAAAgCvNQDzrjUGGwcL4uzAHZUG9xf7Bq41AABI7boAAAA27TgC
SO3HMfTsxzEbA98TAACuNU1BR0lDTWVudUNvbW1hbmQAAwAAQO0tJG8YAAD+////BRAczyRFAgDH
MSRFAgDC7gIAiwAAANYUDQBC9gAAACAFANzt9xcUAiRF9xddJrcHOwCBAFLtxzGEAAIAFAIFACsA
GwNTAhQL9zUAAP7///8FEBzPFAKa7Q9Hnwc7AIEAJEUCAPcXgEUCACwAAAAAEwATAAAIjAAhCBxI
sKDBgwgLAljIsOHCgwAoSJxIEQBECgspTrRoMCLFCRRAYrzokOHIjhJFauSoEGPJiCwHZpwIsqZL
hS9LEly4gIACAgkIHEBQwEACAw8heNTIdKNSCgyiNmDgIOoAAQwCBIhqMWLUr2DBRnDQFWoDCQwi
NFCL1kGEtA+65pwrkGFCpUnvJgwIADs=

}

#End Pint Image
#Image Protocol

set improtocol {
R0lGODdhEgASAPcAAAAAAG0AAJIAAP8AAG0AVZIAVW1tVZJtVW2SVZKSVW0AqpIAqm1tqpJtqm2S
qpKSqra2qtu2qrbbqrOzs7a2/9u2/7bb/9vb/9v//////6crAAABAMk7AADzAuA/AAAAAAAAAAAA
AEAGAAAAAAAA9wPWFE4ifwMJAAAA1hQ6+gIAkOwCAAAyVwQBAA5gAAAAAAAAVuvHMYj6twVQUiAD
WAJABgEQAAAAAEAGAAAAAAAAAAAAABMBCeAABDAA1hQfBR8DWAUfAwAAAAACAOrrAgAIAB8BpysA
AAEANQIBAQYAAQAAANYUZAAAAAIANQIAAC8AFAAaAFYAJwBlAAAAAAAAQPdeAAC3BSHsAAAAAAAA
AADHMQAAAADc68cxiPq3BUIAnhcEAMjsxzEGAAEAJQAfAHoCSezg60nsTiOvBwgD3xOPEwwFSO0a
AC8A///3/wAACAPfE8cDAAD//wAAHwAgAPLrCiavBxjsxzF6At8TUezHMeDsJwHXExjsxzGLax8B
jxPg7EsB1xPc7McxSO3HMRjsxzEBAACAQXBwRXZlbnRzXFNjaGVtZXNcQXBwc1wuRGVmYXVsdFxN
QUdJQ01lbnVDb21tYW5kXC5DdXJyZW50AAngAACDAP4ABgG3BbDsS3tXBIj6twVwLtcFIQDwAAEA
BgAfAEMBAAAAACYAHwAAANYUBQDEFvcXOvqsAx8DeAtDAR8AJgAlACcAHwAmACUAJwAAAK41AADE
Na41jwcfAgAAAADHAP1VrjUCAAAAAgCvNQDzrjUGGwcL4uzAHZUG9xf7Bq41AABI7boAAAA27TgC
SO3HMfTsxzEbA98TAACuNU1BR0lDTWVudUNvbW1hbmQAAwAAQO0tJG8YAAD+////BRAczyRFAgDH
MSRFAgDC7gIAiwAAANYUDQBO9wAAACAFANztnQOTAAEQSO3HMQwF9xcAAAD///8FEBzPFAIkRQIA
VAAM7hQL9zUAAP7///8FEBzPFAIQAhIAAAB+7RkAQwEYABkADwwvASwAAAAAEgASAAAItAAnCBxI
sKDBgwMBAEB4EMCChQYVFnQIcaKAigoVVCQIQMAAhQofFICQQWJCAQoGPIDwwMACBxkwZIBgsmNK
BywVMsjAM0MAAQI7LlBJcyXPCxAuLAA6oSOBAQcYJICA4AACqkMhOh1wFQIECV55mmyKkqtXChQg
UBDLEaUAnF4thC3ZVsEBChEsRJCwl23CBSR7Zqjw4IDXjQICOEiwmMEBBw0cRN3YNMBPAZgx/wzA
sPPAgAA7

}

#Emd Img Protocol
#Image Chart Loader
set imchart {
R0lGODdhFQATAPcAAAAAAG1tVZKSVW1tqpKSqra2qrbbqtvbqrOzs8zMzLa2/9vb/////xdkPrcH
AACmAsABAgAFAIQKAgAFAAAApG0/Azr6AgBk6wIACAACAacrAAABAMk7AAAG6+A/AAAAAAAAAAAA
AEAGAAAAAAAA9wPWFE4ifwMJAAAA1hQ6+gIAkOwCAAAyVwQBAA5gAAAAAAAAVuvHMYj6twVQUiAD
WAJABgEQAAAAAEAGAAAAAAAAAAAAABMBCeAABDAA1hQfBR8DWAUfAwAAAAACAOrrAgAIAB8BpysA
AAEANQIBAQYAAQAAANYUZAAAAAIANQIAAC8AFAAaAFYAJwBlAAAAAAAAQPdeAAC3BSHsAAAAAAAA
AADHMQAAAADc68cxiPq3BUIAnhcEAMjsxzEGAAEAJQAfAHoCSezg60nsTiOvBwgD3xOPEwwFSO0a
AC8A///3/wAACAPfE8cDAAD//wAAHwAgAPLrCiavBxjsxzF6At8TUezHMeDsJwHXExjsxzGLax8B
jxPg7EsB1xPc7McxSO3HMRjsxzEBAACAQXBwRXZlbnRzXFNjaGVtZXNcQXBwc1wuRGVmYXVsdFxN
QUdJQ01lbnVDb21tYW5kXC5DdXJyZW50AAngAACDAP4ABgG3BbDsS3tXBIj6twVwLtcFIQDwAAEA
BgAfAEMBAAAAACYAHwAAANYUBQDEFvcXOvqsAx8DqAdDAR8AJgAlACcAHwAmACUAJwAAAK41AADE
Na41jwcfAgAAAADHAP1VrjUCAAAAAgCvNQDzrjUGGwcL4uzAHZUG9xf7Bq41AABI7boAAAA27TgC
SO3HMfTsxzEbA98TAACuNU1BR0lDTWVudUNvbW1hbmQAAwAAQO0tJG8YAAD+////BRAczyRFAgDH
MSRFAgDC7gIAiwAAANYUDQBa+AAAACAFANztnQOTAAEQSO3HMQwF9xcAAAD///8FEBzPFAIkRQIA
VAAM7hQL9zUAAP7///8FEBzPFAIQAhIAAAB+7RkAQwEYABkArwsvASwAAAAAFQATAAAIgQARCBxI
sKDBgwgTEgTAkKHChQASSDyQAMBDBAAIHFCwcSMBiwoBFFBQYAGDkwUACEgI4ECBlxsLMBgJ8qDI
Ai5fynxZ0yCABSWDAgXas2DLkUFJ0mQ5IChMnEV9EtCJ08DHqEZv8ryJNatDlTwvGp2aUuxCsl1Z
BnBodiDbtgcDAgA7

}


#End Loader
#Image Image loader
set imeye {
R0lGODdhFAARAPcAAAAAAAAAVW1tVZKSVQAAqm1tqpKSqra2qtvbqrOzswAA/////7cFBwCu68cx
XwA/ADr65gUAAHLrAAEFAAAApG0/A0L2AgBk6wIACAD/AacrAAABAMk7AADzAuA/AAAAAAAAAAAA
AEAGAAAAAAAA9wPWFE4ifwMJAAAA1hRC9gIAkOwCAAAyVwQBAA5gAAAAAAAAVuvHMZD2twVQUiAD
WAJABgEQAAAAAEAGAAAAAAAAAAAAABMBCeAABDAA1hQfBR8DWAUfAwAAAAACAOrrAgAIAB8BpysA
AAEANQIBAQYAAQAAANYUZAAAAAIANQIAAC8AFAAaAFYAJwBlAAAAAAAAQPdeAAC3BSHsAAAAAAAA
AADHMQAAAADc68cxkPa3BUIAnhcEAMjsxzEGAAEAJQAfAHoCSezg60nsTiOvBwgD3xOPEwwFSO0a
AC8A///3/wAACAPfE8cDAAD//wAAHwAgAPLrCiavBxjsxzF6At8TUezHMeDsJwHXExjsxzGLax8B
jxPg7EsB1xPc7McxSO3HMRjsxzEBAACAQXBwRXZlbnRzXFNjaGVtZXNcQXBwc1wuRGVmYXVsdFxN
QUdJQ01lbnVDb21tYW5kXC5DdXJyZW50AAngAACDAP4ABgG3BbDsS3tXBJD2twVwLtcFIQDwAAEA
BgAfAEMBAAAAACYAHwAAANYUBQDEFvcXQvasAx8DMApDAR8AJgAlACcAHwAmACUAJwAAAK41AADE
Na41jwcfAgAAAADHAP1VrjUCAAAAAgCvNQDzrjUGGwcL4uzAHZUG9xf7Bq41AABI7boAAAA27TgC
SO3HMfTsxzEbA98TAACuNU1BR0lDTWVudUNvbW1hbmQAAwAAQO0tJG8YAAD+////BRAczyRFAgDH
MSRFAgDC7gIAiwAAANYUDQA6+gAAACAFANztnQOTAAEQSO3HMQwF9xcAAAD///8FEBzPFAIkRQIA
VAAM7hQL9zUAAP7///8FEBzPFAIQAhIAAAB+7RkAQwEYABkA7wsvASwAAAAAFAARAAAIewATCBxI
sKBBggASKlR4UODChwsNQgRQkCHCiQkvVlRooGJDjAkFCKD4UWEAAgE4ktyYkIBLAghUsjQgQMHJ
kwUWRByocOQBlCgPLNCZ8SKAAzSDDt3pEABNAwAGGJBqAGpRowaQGihw4IBFiQsFFBhwtWECiGbB
li0YEAA7

}


#Image Help
set imhelp {
R0lGODdhDgARAPcAAAAAAAAAVQAAqgAA/wAkAAAkVQAkqgAk/wBJAABJVQBJqgBJ/wBtAABtVQBt
qgBt/wCSAACSVQCSqgCS/wC2AAC2VQC2qgC2/wDbAADbVQDbqgDb/wD/AAD/VQD/qgD//yQAACQA
VSQAqiQA/yQkACQkVSQkqiQk/yRJACRJVSRJqiRJ/yRtACRtVSRtqiRt/ySSACSSVSSSqiSS/yS2
ACS2VSS2qiS2/yTbACTbVSTbqiTb/yT/ACT/VST/qiT//0kAAEkAVUkAqkkA/0kkAEkkVUkkqkkk
/0lJAElJVUlJqklJ/0ltAEltVUltqklt/0mSAEmSVUmSqkmS/0m2AEm2VUm2qkm2/0nbAEnbVUnb
qknb/0n/AEn/VUn/qkn//20AAG0AVW0Aqm0A/20kAG0kVW0kqm0k/21JAG1JVW1Jqm1J/21tAG1t
VW1tqm1t/22SAG2SVW2Sqm2S/222AG22VW22qm22/23bAG3bVW3bqm3b/23/AG3/VW3/qm3//5IA
AJIAVZIAqpIA/5IkAJIkVZIkqpIk/5JJAJJJVZJJqpJJ/5JtAJJtVZJtqpJt/5KSAJKSVZKSqpKS
/5K2AJK2VZK2qpK2/5LbAJLbVZLbqpLb/5L/AJL/VZL/qpL//7YAALYAVbYAqrYA/7YkALYkVbYk
qrYk/7ZJALZJVbZJqrZJ/7ZtALZtVbZtqrZt/7aSALaSVbaSqraS/7a2ALa2Vba2qra2/7bbALbb
Vbbbqrbb/7b/ALb/Vbb/qrb//9sAANsAVdsAqtsA/9skANskVdskqtsk/9tJANtJVdtJqttJ/9tt
ANttVdttqttt/9uSANuSVduSqtuS/9u2ANu2Vdu2qtu2/9vbANvbVdvbqtvb/9v/ANv/Vdv/qtv/
//8AAP8AVf8Aqv8A//8kAP8kVf8kqv8k//9JAP9JVf9Jqv9J//9tAP9tVf9tqv9t//+SAP+SVf+S
qv+S//+2AP+2Vf+2qv+2///bAP/bVf/bqv/b////AP//Vf//qv///yH5BAAAAAAALAAAAAAOABEA
QAiLAP8JHEiwYJt/3/7x+zZgwEJbAApKNIjwX8OG3P5BFChnIDcBAxRqjPjv4L99/P5t+4etTaSB
jQQ2lBly47+OCTP+85fSZhtbQIMKJSkpkqRGRd1IWkrwYMaEKb8BmCrQjcKZ/GbajCNSILcBAkYK
jMltH8OQAm1aTfkPpFmx/7iy7Qp3qt27dv8FBAA7

}

#End Image Help
image create photo imnew -data $imnew -gamma 1 -height 16 -width 16 -palette 5/5/4
image create photo imopen -data $imopen -gamma 1 -height 16 -width 16 -palette 5/5/4
image create photo imsave -data $imsave -gamma 1 -height 16 -width 16 -palette 5/5/4
image create photo imselectall -data $imselectall
#-gamma 1  -palette 5/5/4

image create photo imcopy -data $imcopy -gamma 1 -height 16 -width 16 -palette 5/5/4
image create photo imcut -data $imcut -gamma 1 -height 16 -width 16 -palette 5/5/4
image create photo impaste -data $impaste -gamma 1 -height 16 -width 16 -palette 5/5/4
image create photo imprint -data $imprint 
image create photo improtocol -data $improtocol  
image create photo imchart -data $imchart  
image create photo imeye -data $imeye   
image create photo imhelp -data $imhelp  



frame .ed.menubuttons -relief groove -borderwidth 1
pack .ed.menubuttons -side top  -fill x -expand yes
button .ed.menubuttons.new  -image imnew -command {clear_all .ed.text.t}
button .ed.menubuttons.open -image imopen -command "clear_all .ed.text.t ; textOpen"
button .ed.menubuttons.save -image imsave -command "textSaveAs"
button .ed.menubuttons.selectall -image imselectall -height 16 -width 16 -command {.ed.text.t tag add sel 1.0 end}

button .ed.menubuttons.copy -image imcopy -command {tk_textCopy .ed.text.t}
button .ed.menubuttons.cut -image imcut   -command "tk_textCut .ed.text.t"
button .ed.menubuttons.paste -image impaste -command "tk_textPaste .ed.text.t"
button .ed.menubuttons.print -image imprint -command "printFormat" -width 16 -height 16
button .ed.menubuttons.run -image improtocol -command {run_tcl .ed.text.t} -width 16 -height 16
button .ed.menubuttons.help -image imhelp -command "About"  -width 16 -height 16

label .ed.menubuttons.l -text "" -font {Arial 8 normal}
pack   .ed.menubuttons.new .ed.menubuttons.open .ed.menubuttons.save \
.ed.menubuttons.print .ed.menubuttons.selectall .ed.menubuttons.copy \
.ed.menubuttons.cut .ed.menubuttons.paste .ed.menubuttons.run .ed.menubuttons.help -side left -fill x
pack .ed.menubuttons.l -side left -fill x

bind .ed.menubuttons.new <Enter> ".ed.menubuttons.l config -text {New}"
bind .ed.menubuttons.new <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.open <Enter> ".ed.menubuttons.l config -text {Open File}"
bind .ed.menubuttons.open <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.save <Enter> ".ed.menubuttons.l config -text {Save as...}"
bind .ed.menubuttons.save <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.selectall <Enter> ".ed.menubuttons.l config -text {Select all}" 
bind .ed.menubuttons.selectall <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.copy <Enter> ".ed.menubuttons.l config -text {Copy selected text}"
bind .ed.menubuttons.copy <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.cut <Enter> ".ed.menubuttons.l config -text {Cut selected text}"
bind .ed.menubuttons.cut <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.paste <Enter> ".ed.menubuttons.l config -text {Paste selected text}"
bind .ed.menubuttons.paste <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.print <Enter> ".ed.menubuttons.l config -text {Print formated text}"
bind .ed.menubuttons.print <Leave> ".ed.menubuttons.l config -text {}"
bind .ed.menubuttons.run <Enter> ".ed.menubuttons.l config -text {Run Tcl}"
bind .ed.menubuttons.help   <Enter> ".ed.menubuttons.l config -text {Help}"
bind .ed.menubuttons.help <Leave> ".ed.menubuttons.l config -text {}"

#Text widget
frame .ed.text
text .ed.text.t -wrap none -font {monaco 12} -cursor arrow -yscrollcommand {.ed.text.scrl set} \
               -xscrollcommand  {.ed.text.scrl2 set}
scrollbar .ed.text.scrl -command ".ed.text.t yview"
scrollbar .ed.text.scrl2 -command ".ed.text.t xview" -orient hor
pack .ed.text.scrl -side right -fill y
pack .ed.text.scrl2 -side bottom -fill x
pack .ed.text.t -fill both -expand yes
pack .ed.text -side left -fill both -expand true
bind .ed.text <Enter> "focus .ed.text"

}
proc About {} {
    catch [destroy .about]
    toplevel .about
    wm resizable .about 0 0
    center_win .about
    grab .about
    label .about.l -relief groove -bd 3 -font {arial 11 {bold}} -text "\n TkMC v1.0\n Author: Grigoriy Abramov\n \
            System Administrator of The Center For Population Economics \n \
            The University of Chicago\n \
                 Questions and bug report send to: \n \
            gabramov@cpe.uchicago.edu\n "
           pack .about.l 
    bind .about <Enter> "destroy .about"
}

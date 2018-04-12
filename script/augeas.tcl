#!/usr/bin/wish
#
# Source code is from https://wiki.tcl.tk/41235
#
# Dung Fork -- use augeas to browse system info from /etc etc
# 0.1.0

package require augeas

set ::AUG [augeas::init /]
set ::ABORT 0
array set ::AUGCACHE {}

proc treeview_focus {w} {
    if {![::tk::FocusOK $w]} return
    set item [$w focus]
    if {$item eq ""} {
        catch {
            set item [lindex [$w children {}] 0]
            $w focus $item
            $w see $item
            ttk::treeview::select.choose.browse $w $item
        }
    }
}

ttk::style configure Treeview -rowheight \
    [expr {[font metrics TkDefaultFont -linespace] + 4}]

bind Treeview <FocusIn> {treeview_focus %W}

proc augeas_match pat {
    if {[info exists ::AUGCACHE($pat)]} {
        return $::AUGCACHE($pat)
    }
    set ::AUGCACHE($pat) [augeas::match $::AUG $pat]
}

proc fill_roots {tree} {
    set ::ABORT 0
    foreach dir [lsort -dictionary [augeas::match $::AUG /*]] {
        fill_tree $tree [$tree insert {} end -text $dir \
                             -values [list $dir {} "directory"]]
    }
}

proc fill_tree {tree node {open 0} {dobusy 1}} {
    if {![string match "*irectory" [$tree set $node type]]} return
    if {$open < 0} {
        $tree item $node -open 0
        return
    }
    # already processed?
    if {[$tree set $node type] ne "directory"} return
    if {$dobusy} {
        set count0 0
        set ::ABORT 0
        catch {tk busy hold .}
        update
        set oldfocus [focus]
        catch {
            focus ._Busy
            bind ._Busy <Escape> {set ::ABORT 1}
            bind ._Busy <Any-Key> break
        }
        upvar 0 count0 count
    } else {
        upvar 1 count0 count
    }
    set path [$tree set $node fullpath]
    $tree delete [$tree children $node]
    set list {}
    set toopen {}
    set list [lsort -dictionary [augeas_match "$path/*"]]
    foreach f $list {
        if {[catch {augeas::get $::AUG $f} data]} continue
        set sublist [augeas_match $f/*]
        if {[llength $sublist]} {
            set id [$tree insert $node end -text [file tail $f] \
                        -values [list $f $data "directory"]]
            # make this node openable
            $tree insert $id 0 -text dummy ;# a dummy
            if {$open > 0} {
                lappend toopen $id
            }
        } else {
            set id [$tree insert $node end -text [file tail $f] \
                        -values [list $f $data "file"]]
        }
        incr count
        if {$count > 100} {
            set count 0
            update
        }
        if {$::ABORT} break
    }
    if {!$::ABORT} {
        # stop from rerunning on the current node
        $tree set $node type "processedDirectory"
    }
    if {($open > 0) && [llength $list]} {
        $tree item $node -open 1
    }
    foreach id $toopen {
        fill_tree $tree $id $open 0
    }
    if {$dobusy} {
        focus $oldfocus
        catch {tk busy forget .}
        set ::ABORT 0
    }
}

proc dung_fork {} {
    wm title . "Dung Fork"
    ttk::treeview .tree -columns {fullpath value type} -displaycolumns value \
        -yscroll [list .scroll set] -selectmode browse -show {headings tree}
    ttk::scrollbar .scroll -orient vertical -command [list .tree yview]
    .tree heading \#0 -text Path
    .tree heading value -text Value
    bind .tree <<TreeviewOpen>> {fill_tree %W [%W focus]}
    bind .tree <<TreeviewClose>> {fill_tree %W [%W focus] -1}
    grid .tree -row 0 -column 0 -sticky nsew
    grid .scroll -row 0 -column 1 -sticky ns
    grid columnconfigure . 0 -weight 1
    grid rowconfigure . 0 -weight 1
    fill_roots .tree
}

dung_fork


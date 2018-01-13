#!/usr/bin/env tclsh

package require Tk
package require BWidget
package require tdom

namespace eval ComboBox {#needed to extend BWidget functionality}
proc ComboBox::enable {w what args} {
    switch -- $what {
        history {
            $w configure -values {{}} ;# always keep a blank on top
            foreach evt {<Return> <FocusOut>} {
                $w bind $evt {+ ComboBox::_add %W [%W cget -text]}
            }
        }
        chooser {
            set values [$w cget -values]
            set width 0
            foreach i $values {
                set sl [string length $i]
                if {$sl > $width} {set width $sl}
            }
            set bg [[label .dummy] cget -bg]
            destroy .dummy
            $w setvalue first
            $w configure -width [expr {$width+1}]
            $w configure -editable 0 -relief flat -entrybg $bg
        }
    }
    if {$args != ""} {eval [list $w configure] $args}
}
proc ComboBox::_add {w item} {
    set w [winfo parent $w] ;# binding comes from entry
    set values [$w cget -values]
    if {[lsearch -exact $values $item] < 0} {
        $w configure -values [linsert $values 1 $item]
    }
}
namespace eval starDOM {
    set version 0.42
    set about "<about xmlns:foo=\"http://foo.bar/grill\">
          <!-- demo, self-test, rudimentary documentation -->
          <?Tcl toplevel .greeting; button .greeting.b -text \"Isn't it nice\" \
                  -command {destroy .greeting}; pack .greeting.b ?>
          <name       >starDOM</name>
          <version    >$version</version>
          <description lang=\"en\">A little XML browser - now equipped with a rather long description string to try out the popup feature</description>
          <uses>
            <pkg>Tk [package require Tk]</pkg>
            <pkg>BWidget [package require BWidget]</pkg>
            <pkg>tdom [package require tdom]</pkg>
          </uses>
          <authors foo:test=\"ok?\">
            <author>Rolf Ade</author>
            <author>Richard Suchenwirth</author>
          </authors>
        </about>"
}
#------------------------------------------ PROCEDURE DIVISION.
proc starDOM::attName att {
    if {[llength $att] != 3} {return $att}
    if {[lindex $att 2] == {}} {
       set attName "xmlns"
       if {[lindex $att 1] != {}} {
           append attName : [lindex $att 1]
       }
       return $attName
    } else {
       return [lindex $att 1]:[lindex $att 0]
    }
}
proc starDOM::Eval {query} {
    variable info
    catch {uplevel #0 $query} res ;# execute any Tcl command
    puts "% $query\n$res"
    if {[string length $res]>70} {set res [string range $res 0 69]...}
    set info $res
}
proc starDOM::insertNode {w parent node} {
    set drawcross "auto"
    set fill "black"
    switch [$node nodeType] {
        "ELEMENT_NODE" {
            set text "<[$node nodeName]"
            foreach att [$node attributes] {
                if {[llength $att] == 3} { #(1)..
                    if {[lindex $att 2] == {}} {
                        set attName "xmlns"
                        if {[lindex $att 1] != {}} {
                            append attName ":[lindex $att 1]"
                        }
                    } else {
                        set attName "[lindex $att 1]:[lindex $att 0]"
                    }
                } else {
                    set attName $att
                } ;#..(1)
                append text " $attName=\"[$node getAttribute $attName]\""
            }
            append text ">"
            if {[$node hasChildNodes]} {
                set children [$node childNodes]
                if {[llength $children]==1 && [$children nodeName]=="#text"} {
                    append text [string map {\n " "} [$children nodeValue]]
                } else {
                    set drawcross "allways" ;# bad English, wanted by BWidget
                }
            }
        }
        "TEXT_NODE" {
            set text [string map {\n " "} [$node nodeValue]]
        }
        "COMMENT_NODE" {
            set text "<!--[string map {\n " "} [$node nodeValue]]-->"
            set fill "grey50"
        }
        "PROCESSING_INSTRUCTION_NODE" {
            set text "<?[$node target] [string map {\n "" } [$node data]]?>"
            set fill "grey50"
        }
    }
    $w insert end $parent $node -text $text -fill $fill -drawcross $drawcross
}
proc starDOM::nodeInfo {w node {prefix ""}} {
    variable info
    if {[info command $node]==""} return
    set info "$prefix$node: [$node toXPath]"
    append info " - [llength [$node childNodes]] child(ren)"
    catch {append info " - [string length [$node text]] text chars"}
}
proc starDOM::nodeText {w node} {
    set text [$w itemcget n:$node -text]
    set w2 .[clock clicks]
    toplevel $w2
    wm title $w2 $node
    pack [text $w2.0 -width 50 -height 20 -wrap word -bg lightyellow]
    $w2.0 insert end $text
}
proc starDOM::openCross {w {node ""}} {
    if {$node == ""} {set node [$w selection get]}
    if {[$w itemcget $node -drawcross] == "allways"} {
        foreach child [$node childNodes] {
            insertNode $w $node $child
        }
        $w itemconfigure $node -drawcross "auto"
    }
}
proc starDOM::openFile {w {filename ""}} {
    variable info
    if {$filename == ""} {
        set filename [tk_getOpenFile -filetypes {
          {{XML file} *.xml} {{HTML file} *.html} {{All files} *.*}}]
        }
    if {$filename != ""} {
        cd [file dir $filename] ;# so later opens will start here
        wm title . "$filename - starDOM"
        starDOM::showTree $w $filename
        set info "Loaded $filename - [file size $filename] bytes"
    }
}
proc starDOM::save {{filename ""}} {
    variable root; variable info
    if {$filename == ""} {set filename [lindex [wm title .] 0]}
    set filename [tk_getSaveFile -filetypes {
        {{XML file} *.xml} {{HTML file} *.html} {{All files} *.*}
        } -initialfile $filename -defaultextension .xml]
    if {$filename != ""} {
        set fp [open $filename w]
        $root asXML -channel $fp
        close $fp
        wm title . "$filename - starDOM"
        set info "Saved $filename - [file size $filename] bytes"
    }
}
proc starDOM::search {w} {
    variable mode; variable query; variable info; 
    variable changed; variable next; variable root
    variable nodes
    if {$changed} {
        switch -- $mode {
            case   - case/all -
            XPath - XPath/all {
                set q [expr {$mode=="case" || $mode == "case/all" ?
                    "descendant-or-self::text()\[contains(.,'$query')\]"
                    : $query}]
                set t [time {set nodes [$root selectNodes $q]}]
            }
            nocase - nocase/all -
            regexp - regexp/all {
                set nodes {}
                if {$mode == "nocase" || $mode == "nocase/all"} {
                    set s [string tolower $query]
                    set cond {[string first $s [string tolo [$n nodeValue]]]>=0}
                } else {
                    set cond {[regexp $query [$n nodeValue]]}
                }
                foreach n [$root selectNodes //text()] {
                    if $cond {lappend nodes $n}
                }
            }
            eval {return [Eval $query]}
        }
        set changed 0
        set next [expr {[string first /all $mode] >= 0 ? -1: 0}]
    }
    if {[llength $nodes]} {
        showNode $w
    } else {set info "Not found."}
}
proc starDOM::showNode w {
    variable next; variable hilited; variable info; variable nodes
    foreach hinode $hilited {$w itemconfigure $hinode -fill black}
    set hilited {}
    set nrOfNodes [llength $nodes]
    if {$next == -1} {
        set nr 0; set nrmax [expr {$nrOfNodes - 1}]
    } else {
        set nr $next; set nrmax $next
        nodeInfo $w [lindex $nodes $nr] "[expr {$nr+1}]/$nrOfNodes - "
        if {($nr + 1) == $nrOfNodes} {
            set next 0
        } else {
            incr next
        }
    }
    while {$nr <= $nrmax} {
        set node [lindex $nodes $nr]
        if {$node==""} break
        foreach ancestor [$node selectNodes ancestor::*] {
            openCross $w $ancestor
        $w itemconfigure $ancestor -open 1
        }
        set parent [$node parentNode]
        set sibs [$parent childNodes]
            if {[llength $sibs]==1 && [$sibs nodeName]=="#text"} {
            set node $parent
        }
        $w itemconfigure $node -fill blue
        if {$next > -1} {$w see $node}
        lappend hilited $node
        incr nr
    }
}
proc starDOM::showTree {w string {isText 0}} {
    variable hilited {} root
    variable style
    raise [winfo toplevel $w]
    if {$root != ""} {
        [$root ownerDocument] delete
        set root "" ;# in case later parsing fails
    }
    $w delete [$w nodes root]
    $w selection clear
    if {!$isText && $style == ""} {
        set fd  [tDOM::xmlOpenFile $string]
        set doc [eval dom parse $style -channel $fd]
        close $fd
    } else {
        if {!$isText} {
            set fd [open $string]
            set string [read $fd]
            close $fd
        }
        set doc [eval dom parse $style [list $string]]
    }
    set root [$doc documentElement]
    insertNode $w root $root
    openCross $w $root   ;# Show children of root right after startup
    $w itemconfigure $root -open 1
}
proc starDOM::viewSource {{fn ""}} {
    variable root
    if {$fn == ""} {set fn [lindex [wm title .] 0]}
    catch {destroy .vs}
    toplevel .vs
    wm title .vs "$fn - source"
    bind .vs <Control-space> {starDOM::showTree .t [.vs.t get 1.0 end] 1}
    text .vs.t -wrap word -yscrollcommand ".vs.y set"
    scrollbar .vs.y -ori vert -command ".vs.t yview"
    pack .vs.y -side right -fill y
    pack .vs.t -fill both -expand 1
    if {[file exists $fn]} {
        set fp [open $fn]
        .vs.t insert 1.0 [read $fp]
        close $fp
    } elseif {$fn != "Untitled"} {.vs.t insert 1.0 [$root asXML]}
    if {0} {
        if {[.t selection get] != ""} {
            set node [.t selection get]
            set toPath [$node toXPath]
            dom setStoreLineColumn 1
            set tmpdoc [dom parse [.vs.t get 1.0 end]]
            dom setStoreLineColumn 0
            $tmpdoc documentElement tmproot
            set tmpnode [$tmproot selectNodes $toPath]
            set line [$tmpnode getLine]
            set col  [$tmpnode getColumn]
            $tmpdoc delete
            focus .vs.t
            .vs.t mark set insert $line.$col
            .vs.t see $line.$col
        }
    }
}
proc starDOM::UI {} {
    variable changed 0 mode "case" query "" info "" root "" style ""
    interp alias {} help {} DynamicHelp::register
    foreach i {file new open save} {
      set im($i) [image create photo \
        -file [file join $::BWIDGET::LIBRARY images $i.gif]]
    }
    frame  .f
    Button .f.new -image $im(new) -command {starDOM::viewSource Untitled} \
        -width 16
    help .f.new balloon "Create new XML document
        <Control-space> to parse"
    Button .f.open -image $im(open) -command {starDOM::openFile .t}
    help .f.open balloon "Open existing XML file"
    Button .f.view -image $im(file) -width 16 -command starDOM::viewSource
    help .f.view balloon "View document source
        <Control-space> to reparse after editing"
    Button .f.save -image $im(save) -command starDOM::save
    help .f.save balloon "Save current document to file"
    ComboBox .f.e -width 25 -textvariable starDOM::query
    .f.e enable history
    .f.e bind <Key>    {set starDOM::changed 1}
    .f.e bind <Return> {+ starDOM::search .t}
    help .f.e balloon "Enter search text/expression here.
        Hit <Return> to search (or eval).
        History: see pop-up, or use <Up>/<Down>"
    ComboBox .f.m -values {
        case case/all nocase nocase/all regexp regexp/all XPath XPath/all eval
        } -textvariable starDOM::mode
    .f.m enable chooser -relief ridge
    help .f.m balloon "Search mode (full text, except XPath)
        case:\tcase-sensitive
        nocase:\tcase-insensitive (A=a)
        regexp:\tregular expression
        XPath:\tDon't know? Don't bother!
        */all:\tthe same, all at once
        eval:\texecute Tcl command (to stdout)"
    ComboBox .f.style -values {{} -html -simple} \
        -textvariable starDOM::style
    .f.style enable chooser -relief ridge
    help .f.style balloon "Parsing style:
        (blank): regular = strict
        -html: tolerant for bad HTML
        -simple: fast, 7-bit only"
    eval pack [winfo children .f] -side left -fill y
    pack  .f.e -fill x -expand 1

    Tree .t -yscrollcommand ".y set" -xscrollcommand ".x set" -padx 0 \
            -opencmd "starDOM::openCross .t" -height 20
    bind .t <KeyPress-Right> "starDOM::openCross .t;Tree::_keynav right .t"
    .t bindText <1> {.t selection set}
    .t bindText <1> {+ starDOM::nodeInfo %W}
    .t bindText <Double-1> {starDOM::nodeText %W}
    scrollbar .x -ori hori -command ".t xview"
    scrollbar .y -ori vert -command ".t yview"
    Label .info -textvariable starDOM::info -anchor w -pady 0
    help .info balloon "Short info display
        3/5: 3rd of 5 instances highlighted
        Click on a node for its XPath and #children"
    grid .f   -  -sticky ew
    grid .t   .y -sticky news
    grid .x      -sticky news
    grid .info - -sticky ew
    grid rowconfig    . 1 -weight 1
    grid columnconfig . 0 -weight 1
    if {$::tcl_platform(platform)=="windows"} {
        catch {bind .t.c <MouseWheel> {
            %W yview scroll [expr {int(pow(%D/-120,3))}] units
        }}
        catch {focus .t.c}
    }
}
#---------------------------------------------------- "main"
starDOM::UI
set starDOM::info "Welcome to starDOM $starDOM::version!"
if {[llength $argv] && [file exists [lindex $argv 0]]} {
    starDOM::showTree .t [lindex $argv 0]
} else {
    starDOM::showTree .t $starDOM::about 1
}
bind . <Shift-Escape> {console show}
bind . <Escape>       {exec wish $argv0 &; exit}
trace variable starDOM::mode w {set starDOM::changed 1 ;#}

#!/usr/bin/tclsh
#
# DustMote: A web server in one page of Tcl code.
# Source: http://wiki.tcl.tk/4333
#
# This web server program has a smaller source than any other
# that I have seen or heard of.
# Its name is DustMote, and I hereby place it in the public domain.
#
# I wrote it in the Tcl language because Tcl is free, easy, stable, and
# well documented. For more documentation than comes with the Tcl
# download, one may purchase Brent B. Welch's excellent book, "Practical
# Programming in Tcl and Tk," second edition, Prentice Hall PTR. It is
# well worth the money. It is true that Tcl is not remarkably speedy, but
# it is fast enough for my site, and, though not multi-threaded, it can
# handle many clients at the same time asynchronously, by the use of
# non-blocking channels.
#
# Of course, there are now many freeware server programs to be downloaded
# from the web, and most of them are sturdy professional jobs that go like
# lightning and swarm with useful features. The businessperson ought to
# use one of those. I am an amateur, so I had to write the program myself.
# There are nearly no features. All DustMote can do is serve files, both
# text and image. I offer it to fellow amateurs, so they can ignore other
# people's features and think up new features that have never been thought
# up before.
#
# If you do use my program, remember to change the definition of "root" to
# suit your computer. Be sure to use forward slashes, not backward, or
# else double them so Tcl will understand them rightly.

# Please E-mail complaints to hmk@nadn.navy.mil and do not try to spare my
# feelings. The date of this revision is May 26, 1998.

# Yours truly,
# Harold Kaplan.

set root "/home/danilo/public_html"
set default "index.html"
set port 8080

proc bgerror {trouble} {puts stdout "bgerror: $trouble"}

proc answer {socketChannel host2 port2} {
  fileevent $socketChannel readable [list readIt $socketChannel]
}

proc readIt {socketChannel} {
  global root default
  fconfigure $socketChannel -blocking 0
  set gotLine [gets $socketChannel]
  if { [fblocked $socketChannel] } then {return}
  fileevent $socketChannel readable ""
  set shortName "/"
  regexp {/[^ ]*} $gotLine shortName
  set many [string length $shortName]
  set last [string index $shortName [expr {$many-1}] ]
  if {$last=="/"} then {set shortName $shortName$default }
  set wholeName $root$shortName

  if {[catch {set fileChannel [open $wholeName RDONLY] } ]} {
    puts $socketChannel "HTTP/1.0 404 Not found"
    puts $socketChannel ""
    puts $socketChannel "<html><head><title><No such URL.></title></head>"
    puts $socketChannel "<body><center>"
    puts $socketChannel "The URL you requested does not exist on this site."
    puts $socketChannel "</center></body></html>"
    close $socketChannel
  } else {
    fconfigure $fileChannel -translation binary
    fconfigure $socketChannel -translation binary -buffering full
    puts $socketChannel "HTTP/1.0 200 OK"
    puts $socketChannel ""
    fcopy $fileChannel $socketChannel -command [list done $fileChannel $socketChannel]
  }

}

proc done {inChan outChan args} {
  close $inChan
  close $outChan
}

socket -server answer $port
vwait forever

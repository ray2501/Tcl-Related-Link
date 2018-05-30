#!/usr/bin/env tclsh

#
# Tcl script for download golang binary release
# sudo ./dlgo.tcl
#

package require Tclx
package require http
package require tls

set haveArchive 1
if {[catch {package require archive} errMsg] == 1} {
    puts "Do not find archive package"
    set haveArchive 0
}

set version "1.10.2"
set fileurl "https://dl.google.com/go/go$version.linux-amd64.tar.gz"
set home /home/danilo
set gofile "go$version.linux-amd64.tar.gz"
set dir /usr/local

if {[file exists /usr/local/go]} {
    file delete -force /usr/local/go
}

if {[file exists $gofile]==0} {
    puts "Dowonload file..."
    set f [open $gofile {WRONLY CREAT EXCL}]

    http::register https 443 [list ::tls::socket -ssl3 0 -ssl2 0 -tls1 1]
    set token [http::geturl $fileurl -channel $f]
    http::cleanup $token
    close $f
    puts "Done."
}

if {$haveArchive == 1} {
    ::archive::extract $gofile all all 1 -path $dir
} else {
    set var [list tar -C $dir -xzf $gofile]
    exec >@stdout 2>@stderr {*}$var
}

# Remove file
file delete $gofile

set notfound 1
if {[file exists "$home/.profile"]} {
    set file "$home/.profile"
    set fp [open $file]
    while {[gets $fp line] >= 0} {
        if [regexp -- "GOBIN" $line] {
            set notfound 0
        }
    }
    close $fp
}

if {$notfound == 1} {
    set file "$home/.profile"
    set fp [open $file {RDWR CREAT APPEND}]
    chan puts $fp {export PATH=$PATH:/usr/local/go/bin}
    chan puts $fp {export GOBIN=/home/danilo/go/bin}
    chan puts $fp {export GOARCH=amd64}
    chan puts $fp {export GOROOT=/usr/local/go}
    chan puts $fp {export GOOS=linux}
    chan puts $fp {export GOPATH=/home/danilo/go}
    close $fp
}

# setup owner and group
chown danilo $file
chgrp users  $file


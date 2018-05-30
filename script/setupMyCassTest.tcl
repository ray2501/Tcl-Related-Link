#!/usr/bin/tclsh

#
# Setup my Apache Cassandra test environment (one node)
#

package require Tclx

# Using Tclx to get local IP
set localip [host_info addresses [info hostname]]

# I setup environment variable to know path
if {[info exists env(CASSANDRA_HOME)]} {
    cd $env(CASSANDRA_HOME)
} else {
    puts "No enviroment variable CASSANDRA_HOME..."
    puts -nonewline "Now try to use HOME/Programs/cassandra path (Y/N):"
    flush stdout
    gets stdin answer

    if {[string compare $answer "N"]==0 || [string compare $answer "n"]==0} {
       exit
    } elseif {[string compare $answer "Y"]==0 || [string compare $answer "y"]==0} {
       cd $env(HOME)/Programs/cassandra
    } else {
       puts "Wrong answer... Quit."
       exit
    }
}

# Just give my single node a name
set var [list /usr/bin/sed -i "s/Test Cluster/Cassandra Cluster001/" conf/cassandra.yaml]
exec {*}$var

set var [list /usr/bin/sed -i "s/- seeds: \"127.0.0.1\"/- seeds: \"$localip\"/" conf/cassandra.yaml]
exec {*}$var

set var [list /usr/bin/sed -i "s/listen_address: localhost/listen_address: $localip/" conf/cassandra.yaml]
exec {*}$var

set var [list /usr/bin/sed -i "s/rpc_address: localhost/rpc_address: $localip/" conf/cassandra.yaml]
exec {*}$var

# Enable password auth
set var [list /usr/bin/sed -i "s/AllowAllAuthenticator/PasswordAuthenticator/" conf/cassandra.yaml]
exec {*}$var

puts "===== Setup End ====="


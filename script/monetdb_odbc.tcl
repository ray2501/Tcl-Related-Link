#!/usr/bin/tclsh
#
# For MonetDB ODBC driver and unixODBC test
#
package require tdbc::odbc

set connStr "DSN=MonetDB; UID=monetdb; PWD=monetdb;"
if {[catch {tdbc::odbc::connection create db $connStr}]} {
   puts "Connection failed."
   exit
}

set statement [db prepare {create table person (id integer, name varchar(40), 
                           PRIMARY KEY (id))}]
$statement execute
$statement close

set statement [db prepare {insert into person values(1, 'leo')}]
$statement execute
$statement close

set statement [db prepare {insert into person values(2, 'yui')}]
$statement execute
$statement close

set statement [db prepare {SELECT * FROM person}]

puts "Fetch result:"
$statement foreach row {
    puts "id: [dict get $row id], name: [dict get $row name]"
}

$statement close

set statement [db prepare {drop table person}]
$statement execute
$statement close

db close

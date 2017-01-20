#!/usr/bin/tclsh
#
# BaseX SQL Module (latest stable snapshot) and
# MonetDB JDBC driver test
#

package require BaseXClient

set client [Session new localhost 1984 admin admin]
if {[catch {$client connect}]!=0} {
    puts "Connect fail."
    exit
}

set input {sql:init("nl.cwi.monetdb.jdbc.MonetDriver"),
let $conn := sql:connect('jdbc:monetdb://localhost:50000/demo', 'monetdb', 'monetdb')
return sql:execute($conn, "SELECT id, name FROM sys.tables")}

set query [$client query $input]
set result [$query results]

foreach r $result {
    puts $r
}

$query close
$client close


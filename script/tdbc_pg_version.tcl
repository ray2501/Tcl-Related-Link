#!/usr/bin/tclsh

package require tdbc::postgres

tdbc::postgres::connection create db -user danilo -password danilo -port 5432

set statement [db prepare {
    SELECT VERSION()
}]

$statement foreach row {
    puts [dict get $row version]
}

$statement close
db close

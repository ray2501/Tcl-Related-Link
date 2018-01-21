#!/usr/bin/env tclsh

#
# Using TclCurl to test Apache Rivet and mod_http2 setting
#
package require TclCurl

set curlHandle [curl::init]
$curlHandle configure -url https://localhost/hello.rvt -sslverifyhost 0 \
                      -sslverifypeer 0 -bodyvar result
$curlHandle setopt CURLOPT_HTTP_VERSION 2TLS

catch { $curlHandle perform } curlErrorNumber
if { $curlErrorNumber != 0 } {
    puts "error [curl::easystrerror $curlErrorNumber]"
}

# Print result and clean up
puts $result
$curlHandle cleanup


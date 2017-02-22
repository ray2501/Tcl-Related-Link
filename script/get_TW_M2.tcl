#!/usr/bin/tclsh
############################################################
# 下載台灣中央銀行貨幣總計數M2年增率資料 
############################################################

package require http

set url "http://www.cbc.gov.tw/np.asp?ctNode=643&mp=1"
set token [http::geturl $url -validate 1]

# create an easy-to-use array variable
upvar #0 $token head

set location "http://www.cbc.gov.tw/"
append location [dict get $head(meta) Location]

puts "### Get file: $location"
http::cleanup $token

set filename "cbc_m1b.xls"

set f [open $filename {WRONLY CREAT EXCL}]
set token [http::geturl $location -channel $f]
http::cleanup $token
close $f

exit

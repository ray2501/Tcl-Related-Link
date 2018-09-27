#!/usr/bin/jtclsh
# Test for tclBlend

package require java
java::import java.net.InetAddress
puts "My IP Address is: [ [ java::call InetAddress getLocalHost ] getHostAddress ] "

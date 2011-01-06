#!/bin/sh
# apache_mem.sh
# Calculate the Apache memory usage
ps -ef | grep httpd | grep ^apache | awk '{ print $2 }' | xargs pmap -x | grep 'total kB' | awk '{ print $3 }' | awk '{ sum += $1 } END { print sum }'


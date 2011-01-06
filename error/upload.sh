#!/bin/sh
/usr/bin/clamscan $1 > /dev/null 2>&1
if [ "$?" -eq "1" ]; then
echo "An infected file was found!"
fi


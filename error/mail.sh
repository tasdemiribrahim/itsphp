#!/bin/sh
echo "An SQL injection attempt was blocked:Server: $HOSTNAME -Attacking IP: $REMOTEIP -Attacking host: $REMOTEHOST -Request URI: $REQUESTURI -Arguments: $ARGS -Unique ID: $UNIQUEID" | mail –s 'ModSecurity Alert' tasdemiribrahim@mynet.com
echo Done.


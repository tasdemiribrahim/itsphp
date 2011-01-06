#!/bin/sh
mysql -uweb -ppassword -e "INSERT INTO download (day, downloads) VALUES (CURRENT_DATE, 1) ON DUPLICATE KEY UPDATE downloads = downloads + 1;" fees0_6133083_itsphp


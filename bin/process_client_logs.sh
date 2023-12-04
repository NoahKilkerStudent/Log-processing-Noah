#! /bin/bash


cd "$1" || return

cat var/log/secure* | perl -ne 'print if s/([A-Za-z]+)\W*(\d+ \d+).*Failed password for.* (\S+) from ([\d.]+).*/\1 \2 \3 \4/' > failed_login_data.txt
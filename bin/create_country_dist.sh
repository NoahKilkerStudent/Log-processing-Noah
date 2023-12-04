#! /bin/bash

fileDir=$(mktemp)
cat "$1"/*/failed_login_data.txt | perl -ne 'print if s/.* ([\d.]+$)/\1/' > "$fileDir"

##using perl for text processing
sort "$fileDir" | join /dev/stdin etc/country_IP_map.txt | perl -ne 'print if s/.* ([A-Z]+)/\1/' | sort | uniq -c | perl -ne 'print if s/\D{0,}(\d+) (\w+)/data.addRow([\x27\2\x27, \1])\x3B/' | bin/wrap_contents.sh /dev/stdin html_components/country_dist "$1"/country_dist.html
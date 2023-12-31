#! /bin/bash

fileDir=$(mktemp)
cat "$1"/*/failed_login_data.txt | perl -ne 'print if s/.* (\d+) \S+ \d.*/\1/' > "$fileDir"

##using perl for text processing
sort "$fileDir" | uniq -c | perl -ne 'print if s/\D{0,}(\d+) (\d+)/data.addRow([\x27\2\x27, \1])\x3B/' | bin/wrap_contents.sh /dev/stdin html_components/hours_dist "$1"/hours_dist.html
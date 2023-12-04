#! /bin/bash

MainDir=$(mktemp -d)

for logFile in "$@"
do

    fileName=$(basename "$logFile" .tgz)

    fileBaseDir="$MainDir"/"$fileName"
    mkdir -p "$fileBaseDir"

    tar -zxf "$logFile" -C "$fileBaseDir"

    bin/process_client_logs.sh "$fileBaseDir"

done

 

bin/create_username_dist.sh "$MainDir"
bin/create_hours_dist.sh "$MainDir"
bin/create_country_dist.sh "$MainDir"

bin/assemble_report.sh "$MainDir"

mv "$MainDir"/failed_login_summary.html ./failed_login_summary.html
rm -r "$MainDir"
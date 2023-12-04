#! /bin/bash

cat "$1"/*_dist.html | bin/wrap_contents.sh /dev/stdin html_components/summary_plots "$1"/failed_login_summary.html 
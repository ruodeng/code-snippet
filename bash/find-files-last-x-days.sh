#/bin/sh
#find last 15 days changed files
find /home/devadmin/public_html -type f -mtime -15 -exec ls -l {} \; > last15days.txt
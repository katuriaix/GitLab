#!/bin/bash

# shell script run the commands inside $() and stores the out put into variable called DATE.

DATE=$(date +%m/%d/%y)
#$date --date="yesterday"
echo "Hello, this script is executed at timestamp:$DATE"
#!/bin/bash

# bot.sh
#
# This script gets an HTML iPetitions webpage with curl, passes it to
# formfind.pl, and submits a list of names and emails to the petition.
# FOR EDUCATIONAL PURPOSES ONLY. NOT MY RESPONSIBILITY FOR ANYTHING
# BAD THAT YOU DO WITH THIS SCRIPT.
#
# Author: Raymo111
# Version: 0.1 Nov 18, 2002
#
# HISTORY
#
# 0.1 - May 30 2019 - Created!

echo "Enter iPetition name (From url https://www.ipetitions.com/petition/PETITIONNAME)"
read PNAME
echo "How many signatures?"
read SIGNUM
for (( i = 1; i <= SIGNUM; i++ ))
do
  curl https://www.ipetitions.com/petition/blacktears > site.html
  JWT=$(perl formfind.pl < site.html | grep "NAME=\"jwt\"")
  JWT=${JWT#*VALUE=\"}
  JWT=${JWT%\"*}
  FIRST=$(awk -v line="$i" -v field=1 'NR==line{print $field}' name.list)
  LAST=$(awk -v line="$i" -v field=2 'NR==line{print $field}' name.list)
  sleep 1s
  curl -d jwt="$JWT" -d Submissions[name]="$FIRST $LAST" -d Submissions[email]="$FIRST.$LAST@gmail.com" -d Submissions[show_name]="1" -d Submissions[subscribe_to_similar]="0" https://www.ipetitions.com/petition/$PNAME/sign
  rm -f site.html
done

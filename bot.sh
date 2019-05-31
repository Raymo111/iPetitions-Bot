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
# 1.0 - May 31 2019 - Added call parameters

PNAME=$1
SIGNUM=$2
if [[ -z "$PNAME" ]]; then
  echo "Enter iPetition name (From url https://www.ipetitions.com/petition/PETITIONNAME)"
  read PNAME
fi
if [[ -z "$SIGNUM" ]]; then
  SIGNUM=8
fi
for (( i = 1; i <= SIGNUM; i++ ))
do
  curl -s https://www.ipetitions.com/petition/blacktears > site.html
  JWT=$(perl formfind.pl < site.html | grep "NAME=\"jwt\"")
  JWT=${JWT#*VALUE=\"}
  JWT=${JWT%\"*}
  FIRST=$(curl -s https://www.pseudorandom.name/ | awk -v N=1 '{print $N}')
  LAST=$(curl -s https://www.pseudorandom.name/ | awk -v N=2 '{print $N}')
  echo Sleeping for 3 seconds to prevent spamming...
  sleep 3s
  curl -d jwt="$JWT" -d Submissions[name]="$FIRST $LAST" -d Submissions[email]="$FIRST.$LAST@gmail.com" -d Submissions[show_name]="1" -d Submissions[subscribe_to_similar]="0" https://www.ipetitions.com/petition/$PNAME/sign
  rm -f site.html
  echo Sleeping for 3 seconds to prevent spamming...
  sleep 3s
done

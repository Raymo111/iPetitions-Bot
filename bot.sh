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

exiting() {
  echo ""
  echo "Exiting..."
  rm -f site.html
  exit
}

trap exiting SIGINT

PNAME=$1
SIGNUM=$2

if [[ -z "$PNAME" ]]; then
  echo "Enter petition name (From url https://www.ipetitions.com/petition/PETITIONNAME)"
  read PNAME
fi
if [[ -z "$SIGNUM" ]]; then
  SIGNUM=8
fi

for (( i = 1; i <= SIGNUM; i++ ))
do
  echo "cURLing 'https://www.ipetitions.com/petition/$PNAME' to 'site.html'..."
  echo ""
  curl -s "https://www.ipetitions.com/petition/$PNAME" > site.html

  echo "Extracting unique signature code with 'formfind'..."
  echo ""
  JWT=$(perl formfind.pl < site.html | grep "NAME=\"jwt\"")
  JWT=${JWT#*VALUE=\"}
  JWT=${JWT%\"*}

  echo "Getting name from 'https://www.pseudorandom.name/'..."
  echo ""
  FIRST=$(curl -s "https://www.pseudorandom.name/" | awk -v N=1 '{print $N}')
  LAST=$(curl -s "https://www.pseudorandom.name/" | awk -v N=2 '{print $N}')
  echo " $FIRST $LAST"
  echo ""

  EMAIL="$FIRST.$LAST@gmail.com"
  echo "Email: $EMAIL"
  echo ""

  echo "Sleeping for 3 seconds to prevent spamming..."
  echo ""
  sleep 3s

  echo "Submitting signature..."
  echo ""
  curl -d jwt="$JWT" -d "Submissions[name]"="$FIRST $LAST" -d "Submissions[email]"="$EMAIL" -d "Submissions[show_name]"="1" -d "Submissions[subscribe_to_similar]"="0" "https://www.ipetitions.com/petition/$PNAME/sign"
  echo ""

  echo "Removing 'site.html'"
  echo ""
  rm -f site.html

  echo "Sleeping for 3 seconds to prevent spamming..."
  echo ""
  sleep 3s
done

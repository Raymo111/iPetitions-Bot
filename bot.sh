#!/bin/bash

# bot.sh
#
# This script gets an HTML iPetitions webpage with curl, passes it to
# formfind.pl, and submits a list of randomly generated names from
# https://www.pseudorandom.name/ and emails to the petition.
# FOR EDUCATIONAL PURPOSES ONLY. NOT MY RESPONSIBILITY FOR ANYTHING
# BAD THAT YOU DO WITH THIS SCRIPT.
#
# Author: Raymo111
# Version: 1.1 November 16, 2019
#
# HISTORY
# 0.1 - May 30, 2019 - Created!
# 1.0 - May 31, 2019 - Added call parameters
# 1.1 - November 16, 2019 - Now works from PATH

exiting() {
  echo ""
  echo "Exiting..."
  rm -f site.html
  exit
}

trap exiting SIGINT

PNAME=$1
SIGNUM=$2
TMP=/tmp/iPetitions-Bot

if [[ -z "$PNAME" ]]; then
  echo "Enter petition name (From url https://www.ipetitions.com/petition/PETITIONNAME)"
  read PNAME
fi
if [[ -z "$SIGNUM" ]]; then
  SIGNUM=8
fi

for (( i = 1; i <= SIGNUM; i++ ))
do
  echo "cURLing 'https://www.ipetitions.com/petition/$PNAME' to '$TMP/petition.html'..."
  mkdir -p $TMP
  curl -s "https://www.ipetitions.com/petition/$PNAME" > $TMP/petition.html

  echo "Extracting unique signature code with 'formfind'..."
  JWT=$(perl /usr/lib/formfind.pl < $TMP/petition.html | grep "NAME=\"jwt\"")

  echo "Removing '$TMP/petition.html'"
  rm -f $TMP/petition.html

  JWT=${JWT#*VALUE=\"}
  JWT=${JWT%\"*}

  echo "Getting name from 'https://www.pseudorandom.name/'..."
  FIRST=$(curl -s "https://www.pseudorandom.name/" | awk -v N=1 '{print $N}')
  LAST=$(curl -s "https://www.pseudorandom.name/" | awk -v N=2 '{print $N}')
  echo " $FIRST $LAST"

  EMAIL="$FIRST.$LAST@gmail.com"
  echo " Email: $EMAIL"

  echo "Sleeping for 3 seconds to prevent being banned for spamming..."
  sleep 3s

  echo "Submitting signature..."
  curl -d jwt="$JWT" -d "Submissions[name]"="$FIRST $LAST" -d "Submissions[email]"="$EMAIL" -d "Submissions[show_name]"="1" -d "Submissions[subscribe_to_similar]"="0" "https://www.ipetitions.com/petition/$PNAME/sign"
  echo ""

  echo "Sleeping for 3 seconds to prevent being banned for spamming..."
  sleep 3s
done

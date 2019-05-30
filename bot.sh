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
curl https://www.ipetitions.com/petition/blacktears > site.html
JWT=`perl formfind.pl < site.html | grep "NAME=\"jwt\""`
JWT=${JWT#*VALUE=\"}
JWT=${JWT%\"*}

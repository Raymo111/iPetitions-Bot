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

FIRST=$(awk -v line=1 -v field=1 'NR==line{print $field}' name.list)
LAST=$(awk -v line=1 -v field=2 'NR==line{print $field}' name.list)
echo "$FIRST $LAST"
echo "$FIRST.$LAST@gmail.com"

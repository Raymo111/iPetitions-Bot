#!/bin/bash

# bot.sh
#
# This script is an installer for iPetitions-Bot.
# FOR EDUCATIONAL PURPOSES ONLY. NOT MY RESPONSIBILITY FOR ANYTHING
# BAD THAT YOU DO WITH THIS SCRIPT.
#
# Author: Raymo111
# Version: 1.0 November 16, 2019
#
# HISTORY
# v1.1 - November 16, 2019 - Now works from PATH
# v1.2 - January 18, 2020 - IP randomization enabled
# v1.3 - January 28, 2020 - Revamped interface with options

TMP=/tmp/iPetitions-Bot
LIB=/usr/lib/ipetitions-bot
BIN=/usr/bin/ipetitions-bot

git clone https://github.com/Raymo111/iPetitions-Bot.git $TMP
install -Dm644 $TMP/LICENSE "/usr/share/licenses/ipetitions-bot/LICENSE"
mkdir -p $LIB
cp -f $TMP/bot.sh $LIB
chmod +x $LIB/bot.sh
cp -f $TMP/formfind.pl $LIB
rm -rf $BIN
ln -s $LIB/bot.sh $BIN
chmod +x $BIN
rm -rf $TMP
echo -e "Installation done.\nGPL-v3.0 License for this program can be found at /usr/share/licenses/ipetitions-bot/LICENSE.\nRun\"ipetitions-bot -h\" for help."

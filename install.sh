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
# 1.0 - November 16, 2019 - Now works from PATH
install -Dm644 LICENSE "/usr/share/licenses/ipetitions-bot/LICENSE"
mkdir -p "/usr/lib/ipetitions-bot"
cp -f bot.sh "/usr/lib/ipetitions-bot"
chmod +x "/usr/lib/ipetitions-bot/bot.sh"
cp -f formfind.pl "/usr/lib/ipetitions-bot"
ln -s "/usr/lib/ipetitions-bot/bot.sh" "/usr/bin/ipetitions-bot"
chmod +x "/usr/bin/ipetitions-bot"
echo -e "Installation done.\nGPL-v3.0 License for this program can be found at /usr/share/licenses/ipetitions-bot/LICENSE.\nYou can now delete this git repo.\nTo run the program just run \"ipetitions-bot\"."

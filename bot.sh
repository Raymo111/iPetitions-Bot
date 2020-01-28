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
# v0.1 - May 30, 2019 - Created!
# v1.0 - May 31, 2019 - Added call parameters
# v1.1 - November 16, 2019 - Now works from PATH
# v1.2 - January 18, 2020 - IP randomization enabled
# v1.3 - January 28, 2020 - Revamped interface with options

# Reset option index in case getopts has been used
OPTIND=1

# Defaults
TMP=/tmp/pbot
VERBOSE=0
COUNT=0
SIGNUM=10

# Safe exit
exiting() {
	echo -e "\nExiting..."
	rm -rf $TMP
	exit
}

# Print info
show_help () {
	echo -e "
Welcome to iPetitions-Bot, a bot that lets you automatically sign petitions as many times as you want.
Required dependencies:
	curl, perl, jq
To use this program, run:
	ipetitions-bot [-OPTIONS] [PETITIONNAME]
Options:
	-h		Show this information
	-v		Be verbose and output more info
	-c		Print count after each successful signature
	-n [SIGNUM]	Number of signatures (default is 10)
The petition name can be found from the url (https://www.ipetitions.com/petition/PETITIONNAME)
Report any bugs and contribute suggestions here: https://github.com/Raymo111/iPetitions-Bot/issues/new
"
}

# Trap ctrl+c for safe exit
trap exiting SIGINT

# Handle options
while getopts hvcn: OPT; do
    case $OPT in
        h) show_help
        	exit 0
        	;;
        v) VERBOSE=1
        	;;
        c) COUNT=1
           	;;
		n) SIGNUM=$OPTARG
			;;
        *)
			echo >&2 "Invalid option." # Print to stderr
			show_help
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))"   # Discard options

# Check for PNAME
PNAME=$@
if [[ -z "$@" ]]; then
	echo >&2 "You must specify the petition to sign."
	show_help
	exit 1
fi

mkdir -p $TMP

# Sign
i=0
while [ $i -lt $SIGNUM ]
do
	((i++))
	if [ $COUNT == 1 ]; then echo "[$i/$SIGNUM]"; fi

	# Generate random IP
	IP1=$( shuf -n 1 <(seq 255 | grep -Fxv -e{1,10,192}) )
	IP2=$(( RANDOM % 255 ))
	IP3=$(( RANDOM % 255 ))
	IP4=$(( RANDOM % 255 ))
	IP="$IP1.$IP2.$IP3.$IP4"
	echo "Random IP: $IP"

	if [ $VERBOSE == 1 ]; then echo "cURLing 'https://www.ipetitions.com/petition/$PNAME' to '$TMP/petition.html'..."; fi
	curl -sH "X-Forwarded-For: $IP" "https://www.ipetitions.com/petition/$PNAME" > $TMP/petition.html

	if [ $VERBOSE == 1 ]; then echo "Extracting unique signature code with 'formfind'..."; fi
	JWT=$(perl /usr/lib/ipetitions-bot/formfind.pl < $TMP/petition.html | grep "NAME=\"jwt\"")
	JWT=${JWT#*VALUE=\"}
	JWT=${JWT%\"*}

	# Check for existing petition
	if [[ -z "$JWT" ]]; then
		echo -e >&2 "Petition not found.\nIf this issue persists please file a bug report."
		exit 1
	fi

	if [ $VERBOSE == 1 ]; then echo "Removing '$TMP/petition.html'"; fi
	rm -f $TMP/petition.html

	if [ $VERBOSE == 1 ]; then echo "Getting name from 'https://www.pseudorandom.name/'..."; fi
	FIRST=$(curl -sH "X-Forwarded-For: $IP" "https://www.pseudorandom.name/" | awk -v N=1 '{print $N}')
	LAST=$(curl -sH "X-Forwarded-For: $IP" "https://www.pseudorandom.name/" | awk -v N=2 '{print $N}')
	echo "Name: $FIRST $LAST"
	EMAIL="$FIRST.$LAST@gmail.com"
	echo "Email: $EMAIL"

	if [ $VERBOSE == 1 ]; then echo "Sleeping for 1 second to prevent overload..."; fi
	sleep 1s

	if [ $VERBOSE == 1 ]; then echo "Submitting signature..."; fi
	RESULT=$(curl -sH "X-Forwarded-For: $IP" -d jwt="$JWT" -d "Submissions[name]"="$FIRST $LAST" -d "Submissions[email]"="$EMAIL" -d "Submissions[show_name]"="1" -d "Submissions[subscribe_to_similar]"="0" "https://www.ipetitions.com/petition/$PNAME/sign" | jq -r '.result')
	echo "Result: $RESULT"
	if [ "$RESULT" == "error" ]; then
		echo "Retrying..."
		((i--))
	fi
	echo ""
done

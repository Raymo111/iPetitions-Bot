# iPetitions-Bot
#### By Raymo111
#### A bot to get signatures for iPetitions, written in Bash.

## Compatibility
https://img.shields.io/badge/Arch-Tested-brightgreen https://img.shields.io/badge/Ubuntu%2018.04%20LTS-Tested-brightgreen https://img.shields.io/badge/WSL-Tested-brightgreen

It should work on anything else that runs bash.

## Warranty
This program does not come with any kind of warranty. If you get banned from iPetitions for violating its terms and conditions, I take no responsibility.
##### Note: This program uses a Perl script by Daniel Stenberg <daniel@haxx.se>.

## Dependencies
 * Bash
 * Curl
 * Git

## Usage Instructions
First clone this repository with:
```
git clone https://github.com/Raymo111/iPetitions-Bot
```
Next go into the newly cloned repository:
```
cd iPetitions-Bot
```
Now add run permissions to bot.sh with:
```
chmod +x bot.sh
```
Finally run the script with:
```
./bot.sh
```
You can run with parameters as of V1:
```
./bot.sh PETITIONNAME NUMBEROFSIGNATURES
```
Unless you can solve the CAPTCHA problem, don't use the `NUMBEROFSIGNATURES`; the default is 8 signatures.
You can run this bot once per hour to bypass the CAPTCHA, or switch IP addresses.

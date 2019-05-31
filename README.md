# iPetitions-Bot
#### By Raymo111
#### A bot to get signatures for iPetition, written in Bash.

## Compatibility
This program has only been tested on Ubuntu 18.04 LTS (including WSL). It *should* work on other Linux distributions, as long as Bash is installed.

## Warranty
This program does not come with any kind of warranty. If you get banned from iPetition for violating its terms and conditions, I take no responsibility. **This program is for educational purposes ONLY**.
##### Note: This program uses a Perl script by Daniel Stenberg <daniel@haxx.se>.

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
You can run this bot once an hour to bypass the CAPTCHA, or switch ip addresses.

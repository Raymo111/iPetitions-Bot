# iPetitions-Bot
![License](https://img.shields.io/github/license/raymo111/iPetitions-Bot)

A bot to get signatures for iPetitions.

## Compatibility
![Tested on Arch](https://img.shields.io/badge/Arch-Tested-brightgreen) ![Tested on Ubuntu 18.04 LTS](https://img.shields.io/badge/Ubuntu%2018.04%20LTS-Tested-brightgreen) ![Tested on WSL](https://img.shields.io/badge/WSL-Tested-brightgreen)

It should work on anything else that runs bash.

## Warranty
This program does not come with any kind of warranty. If you get banned from iPetitions for violating its terms and conditions, I take no responsibility.
##### Note: This program uses a Perl script by Daniel Stenberg <daniel@haxx.se>.

## Dependencies
 * Curl
 * Perl

## Installation
Do the following in bash:
```
git clone https://github.com/Raymo111/iPetitions-Bot && cd iPetitions-Bot && chmod +x install.sh && sudo ./install.sh
```

## Usage
ipetitions-bot PETITIONNAME NUMBEROFSIGNATURES
```
Unless you can solve the CAPTCHA problem, don't use the `NUMBEROFSIGNATURES`; the default is 8 signatures.
You can run this bot once per hour to bypass the CAPTCHA, or switch IP addresses.

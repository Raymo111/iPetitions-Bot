# iPetitions-Bot
![License](https://img.shields.io/github/license/raymo111/iPetitions-Bot)
![AUR license](https://img.shields.io/aur/license/ipetitions-bot)
![AUR version](https://img.shields.io/aur/version/ipetitions-bot)
![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/Raymo111/iPetitions-Bot?include_prereleases)
![Language count](https://img.shields.io/github/languages/count/Raymo111/iPetitions-Bot)
![Top language](https://img.shields.io/github/languages/top/Raymo111/iPetitions-Bot)
![Latest commit](https://img.shields.io/github/last-commit/Raymo111/iPetitions-Bot)
![Maintenance](https://img.shields.io/maintenance/yes/2020)

A bot to get signatures for iPetitions.

## Compatibility
![Tested on Arch](https://img.shields.io/badge/Arch-Tested-brightgreen)
![Tested on Ubuntu 18.04 LTS](https://img.shields.io/badge/Ubuntu%2018.04%20LTS-Tested-brightgreen)
![Tested on WSL](https://img.shields.io/badge/WSL-Tested-brightgreen)

It should work on anything else that runs bash.

## Warranty
This program does not come with any kind of warranty. If you get banned from iPetitions for violating its terms and conditions, I take no responsibility.
##### Note: This program uses a Perl script by Daniel Stenberg \<<daniel@haxx.se>\>.

## Dependencies
 * curl
 * perl
 * jq

## Installation
Run the following in bash:
```
wget -O - --no-cache https://raw.githubusercontent.com/Raymo111/iPetitions-Bot/master/install.sh | sudo bash
```

## Usage
```
ipetitions-bot [-OPTIONS] [PETITIONNAME]
```
Running just `ipetitions-bot -h` will show a list of options.

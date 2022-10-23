# iPetitions-Bot
![License](https://img.shields.io/github/license/raymo111/iPetitions-Bot)
![AUR license](https://img.shields.io/aur/license/ipetitions-bot)
![AUR version](https://img.shields.io/aur/version/ipetitions-bot)
![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/Raymo111/iPetitions-Bot?include_prereleases)
![Language count](https://img.shields.io/github/languages/count/Raymo111/iPetitions-Bot)
![Top language](https://img.shields.io/github/languages/top/Raymo111/iPetitions-Bot)
![Latest commit](https://img.shields.io/github/last-commit/Raymo111/iPetitions-Bot)
![Maintenance](https://img.shields.io/maintenance/yes/2022)

A bot to get signatures for iPetitions.

## Compatibility
![Tested on Arch](https://img.shields.io/badge/Arch-Tested-brightgreen)
![Tested on Ubuntu 18.04 LTS](https://img.shields.io/badge/Ubuntu%2018.04%20LTS-Tested-brightgreen)
![Tested on WSL](https://img.shields.io/badge/WSL-Tested-brightgreen)

It should work on anything else that runs bash.

## Warranty
This program does not come with any kind of warranty. If you get banned from iPetitions for violating its terms and conditions, I take no responsibility.

## Dependencies
 * curl
 * perl
 * jq
 * GNU grep

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

## Changelog
- v0.1 - May 30, 2019 - Created!
- v1.0 - May 31, 2019 - Added call parameters
- v1.1 - November 16, 2019 - Now works from PATH
- v1.2 - January 18, 2020 - IP randomization enabled
- v1.3 - January 28, 2020 - Revamped interface with options
- v1.4 - August 18, 2021 - Use grep to get token and remove formfind dependency

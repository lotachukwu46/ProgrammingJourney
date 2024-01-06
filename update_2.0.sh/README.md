# Automated System Updater

Author: Lotachukwu Odiegwu

## Overview

This script automates system updates based on the detected Linux distribution. It supports a variety of distributions, including Ubuntu, Debian, Kali, Linux Mint, Arch, Fedora, CentOS, and Red Hat.

## Usage

1. Run with sudo/root privileges.
2. Ensure network connectivity.
3. Customize behavior in `config.sh`.

## Dependencies

- `distribution_detector.sh`
- `update_packages.sh`
- `config.sh`
- `log.sh`
- `network.sh`

## Files

- **`update.sh`**: Main update script.
- **`distribution_detector.sh`**: Distribution detection functions.
- **`config.sh`**: Configuration settings.
- **`log.sh`**: Logging functions.
- **`network.sh`**: Network check functions.
- **`update_packages.sh`**: Update functions for different distributions.

Feel free to customize settings in `config.sh` to suit your preferences.


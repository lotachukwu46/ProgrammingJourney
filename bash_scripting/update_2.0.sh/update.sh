#!/bin/bash

# update.sh - Automated system update script
#
# This script is designed to streamline the process of updating different Linux distributions.
# It dynamically detects the distribution, checks for network connectivity, and performs updates
# based on the distribution type. Users can customize update parameters and settings in the
# accompanying configuration file (config.sh).
#
# Author: Lotachukwu Odiegwu
# Date: January 6, 2024
# Version: 2.0
# GitHub Repository: https://github.com/lotachukwu46/ProgrammingJourney/bashscripting/update_2.0.sh
#
# Usage:
#   - Run this script with sudo or as root to ensure proper system update privileges.
#   - Customize the update behavior and settings in the config.sh file.
#   - Ensure network connectivity for the script to check and proceed with updates.
#
# Dependencies:
#   - distribution_detector.sh: File containing functions to detect Linux distribution.
#   - update_packages.sh: File containing functions for updating Debian, Arch, and RPM systems.
#   - config.sh: Configuration file for customizing script behavior.
#   - log.sh: File with functions for logging messages during script execution.
#   - network.sh: File with functions for checking network connectivity.
#
# Notes:
#   - This script is designed for educational purposes and can be modified for personal use.
#   - Always backup important data before running system updates, especially major upgrades.


# Source external features
# to detect the distribution
source distribution_detector.sh
# For configuration
source config.sh
# For logging
source log.sh
# To Check for network connectivity
source network.sh
# The update logic
source update_packages.sh

# Function to perform system update based on the detected distribution
perform_system_update() {
	
	networkcheck # Check for network
	distribution_detect # Check for the specific distribution
	
	case "${distribution,,}" in
		ubuntu|debian|kali|linuxmint)
			debian_based
			;;
		arch)
			arch_linux
			;;
		fedora|centos|redhat)
			rpm_based
			;;
		*)
			echo "Unsupported distribution: $distribution"
			log "Unsupported Distribution Detected: $distribution"
			exit 2 # Unsupported distribution
			;;
	esac
}

# Main execution

# if not log in as root
if [[ $EUID -ne 0 ]]; then
	# Ask to be runned with sudo
	echo "This script must be run with sudo or as root."
	read -p "Press Enter to run with sudo or Q to quit." choice
	if [[ "$choice" =~ ^[Qq]$ ]]; then
		echo "Exiting script"
		exit 1
	elif [[ -z "$choice" ]]; then
		echo "Running script with sudo"
		sudo bash "$0" "$@"
		exit 0 # Existing after running script to prevent it from running twice
	else
		echo "Invalid command"
		exit 1
	fi
fi

perform_system_update

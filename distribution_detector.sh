#!/bin/bash

# Distribution detection functions
# Author: Lotachukwu Odiegwu
# Version: 1.0
# Usage: Source in other scripts.
# Dependencies: log.sh
# Supported Distributions:
# Ubuntu, Debian, Kali, Linux Mint, Arch, Fedora, CentOS, Red Hat

# This script is used to detect the linux distribution of a system
# In other to determine the update to perfrom if distribution is supported

# Source the log.sh file for effective logging and error trapping
source log.sh

# Function to detect distribution
distribution_detect() {
	# Store the detected distribution variable name and the update_host
	local distribution
	update_host=""

	# Capture commands for error traping
	trap 'error_handler "$BASH_COMMAND" ' ERR


	# Attemp to detect os with different methods
	if distribution=$(lsb_release -is 2> /dev/null); then
		: # Then do northing if lsb_release succeeds

	elif distribution=$(cat /etc/os-release | grep -E "^ID=" | cut -d '=' -f2 | tr -d '"'); then
			: # Then do northing if cat /etc/os-release ... succeeds

		elif distribution=$(hostnamectl | grep "Operating System" | cut -d':' -f2 | tr -d ' '); then
				: # Then do northing if hostnamectl succeeds

				# Automatic detection failed prompt user for distribution name
			elif	[[ -z "$distribution" ]]; then
				echo "Automatic distribution detection failed."
				echo "supported distribution: "
				echo "Ubuntu"
				echo "Kali"
				echo "Debian"
				echo "Linuxmint"
				echo "Arch linux"
				echo "Fedora"
				echo "centos"
				echo "Redhat"
				echo "If your Distribution is not supported press 1 to exit"
				echo "Else enter to the name of your os to continue"
				read -p "Please 'os' in lower case" distribution

				# Exit if user choose  to exit
				if [[ $distribution == 1 ]]; then
					exit 2 # Unsupported distribution exit code
				fi
	fi

	# Validate and normalize the distribution name
	case "${distribution,,}" in # Convert to lower case for matching
		ubuntu|debian|kali|linuxmint) # Debian based distribution
			update_host=$(grep '^deb ' /etc/apt/sources.list | head -n1 | cut -d' ' -f2) # update host for debian based systems
			echo "Idetified as: $distribution"
			log "detected distribution: $distribution"
			return 0 # Indicates success
			;;
		arch)
			return 0 # Indicates success
			update_host=$(grep '^Server = ' /etc/pacman.conf | cut -d'=' -f2-) # Update host for arch linux systems
			echo "Iddentified as $distribution"
			log "Identified as $distribution"
			return 0
			;;
		fedora|centos|redhat) # RPM-based distributions
			update_host=$(grep -m1 '^baseurl = ' /etc/yum.repos.d/*.repo | cut -d'=' -f2) # Update server for RPM based
			echo "Identified as: $distribution"
			log "Idetifiedas as: $distribution"
			return 0 # Indicates succes
			;;
		*)
			echo "Unsupported OS : $distribution"
			log "Unsupported Distribution Detected : $distribution"
			exit 2 # Unsupported distribution
			;;
	esac
}

distribution_detect


# Designed by lotachukwu

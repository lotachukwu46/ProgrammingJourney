#!/bin/bash

# Automated system updater
# Author: Lotachukwu Odiegwu
# Version: 2.0
# Usage: Run with sudo/root privileges.
# Dependencies: distribution_detector.sh, update_packages.sh, config.sh, log.sh, network.sh


# This is the main file it uses the functions tn the other files to perform the perfectly
# Enabling smooth updates

# Source external files

source distribution_detector.sh
source update_packages.sh
source config.sh
source log.sh
source network.sh

# Function to perform main update based on  the value of the distribution

perform_update() {

	 # Capture commands for error trapping
	 trap 'error_handler "$BASH_COMMAND" ' ERR

	# Check for the value of distribution from the distribution_detector.sh file
	case "${distribution,,}" in
		ubuntu|debian|kali|linuxmint)
			# If it's debian based perform the debian based function
			debian_based
			;;
		arch)
			# If arch? perform the arch function
			arch
			;;
		centos|fedora|readhat)
			# If it's rpm based perform the rpm functions
			rpm_based
			;;
		*)
			# Else display error message
			echo "Unsupported distribution: $distribution"
			log "Unsupported Distribution Detected: $distribution"
			exit 2 # Unsupported distribution
			;;
	esac
	
	read -p "Press enter to continue or q to quit" option
                if [[ "$option" == "Q" || "$option" == "q" ]]; then
                        log "Existing debian function"
                        exit 0
			exit 0
                fi

}

# Ckeck for Root previllages else run with sudo or exit with user's permission
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run with sudo or as root."
	read -p "Press enter to run with sudo or Q to quit." choice
	if [[ "$choice" =~ ^[Qq]$ ]]; then
		echo "Exiting script"
		exit 1
	elif [[ -z "$choice" ]]; then
		echo "running script"
		sudo bash "$0" "$@"
	else
		# Invalid option display error
		echo "Invalid command"
		return
	fi
fi

# Detect the distribution using the distribution_detect funcion from the distribution_detector.sh file
distribution_detect

# Check for network before performing update from the network.sh file using the networkcheck function
networkcheck

# If Root or sudo previllages granted , network available and supported distribution perform update.

perform_update

# End of script
# Desineged was by Lotachukwu

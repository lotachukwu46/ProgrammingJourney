#!/bin/bash

# Network check functions
# Author: Lotachukwu Odiegwu
# Version: 1.0
# Usage: Source in other scripts.
# Dependencies: distribution_detector.sh, log.sh


# This file checks for network by connecting to google
# If success full connects to the update host
# To avoid network errors from the network server

# Source the logging file for consistent loging
# And the distribution_detector.sh file to get the update host value

source log.sh
source distribution_detector.sh

# Function to check for network
networkcheck()

{

	# Capture commands for error traping
        # trap 'error_handler "$BASH_COMMAND" ' ERR

	# While loop to retry for network depending on user's chice
	while true; do

	# Multiple Use of ping to check connectivity to a reliable host
	for i in {1..3}; do # 3 times trial
	ping -c 4 www.google.com > /dev/null 2>&1

	# Check if connection to google was successfull
	if [[ $? -eq 0 ]]; then
		# Connectivity successfull
		log "Network connection verified"
		#ping -c 4 "$update_host" > /dev/null 2>&1
		#if [[ $? -eq 0 ]]; then
			# Host server available for update
			#log "Host server available for update"
			return 0 # Success
		#else
			#log "Host server not available for update."
			#cho "Host server not available for update"
			#cho "Please try again later."
			#eturn 1 # General network error
		#fi
	else
		sleep 5 # Wait before retry
	fi
done
		# Connectivity failed
		# Flag in case of ivalid option to repromt option of retrying for network
		no_nwtwork=0
		while no_network=0; do
		echo "Network connection not available"
		echo "Please check your network connection"
		echo "Press enter to retry or 1 to exit"
		read -p	"choice : " choice
		case $choice in
			# If $choice is empty breaks out of the inner loop and retry for network
			"") break ;;
			# If 1 echo's a lovely message and exit
			1) echo "Thanks and have a nice day!"
				log "Network not available"
				no_network=-1;; # Network error
			       	# If option is invalid
				# Reprompt to try again by not breaking out of the inner loop
				*) echo "Invalid option"
		esac
	done
done
}
# networkcheck

# I commented out the network check to the host_server
# Because of error messages displayed but if i resolve the
# I'll uncommet and likely modify those lines

# Designed by lotachukwu

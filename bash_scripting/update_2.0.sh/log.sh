#!/bin/bash

# Logging functions for consistent documentation
# Author: Lotachukwu Odiegwu
# Version: 1.0
# Usage: Source in other scripts.
# Dependencies: network.sh, distribution_detector.sh

# This file contains the logging function for
# consistent documentation and the error handler function for handling errors


# Function to handle errors
error_handler() {
	# Variables to store error information
	local error_message="$1"
	# Pass the first arguement as the error message
        local error_line="${3:-$(caller)}"
	# Get line number or use caller if unavailable
	
	# Check if error is due to network
	for i in {1..2}; do
	ping -c 4 www.google.com > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
		break;
	else
		sleep 5
		network=false
	fi
done

if [[ $network == false ]]; then
	log "Network interuputed. Exiting."
	echo "Network error: check your connection and try again"
	exit 3 # Network error
fi
	echo "Oops! Something went wrong. Please contact support for assistance."
        log "Error details: $error_message on line $error_line in $0"

        # Check if the error is due to unsupported distribution
        if [[ "$error_message" = "unsupported distribution" ]]; then
                echo "Please try with a supported distribution"
                echo "supported distributions:"
                echo "Ubuntu"
                echo "Kali"
                echo "Debian"
                echo "Linuxmint"
                echo "Arch linux"
                echo "Fedora"
                echo "centos"
                echo "Redhat"
		log "Unsurpported distribution"
                exit 2 # exit code for unsupported Distribution
        fi

}

log() {
	# Variables for loging
        local level="${1:-info}"
	# Stores the fist aguement pass to it or info as default
        local message="${@:2}"
	# Stores error messages
        local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
	# Marks activity with date and time

	# Redirect stdout to a file (update.log)
	#And stderr to a different file
	echo "[${timestamp}][${level}] ${message}" >> update.log 2>> error.log

}
log
# Desined by Lotachukwu

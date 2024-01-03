#!/bin/bash

source log.sh

networkcheck() {

	# Multiple Use of ping to check connectivity to a reliable host
	for i in {1..3}; do # 3 times trial
	ping -c 4 www.google.com > /dev/null 2>&1

	if [[ $? -eq 0 ]]; then
		# Connectivity successfull
		log "Network connection verified"
		return 0 # Indicates success
	else
		sleep 5 # Wait before retry
	fi
done
		# Connectivity failed
		echo "Network connection not available"
		echo "Please check your network connection"
		log "Network workconnection not available"
		return 1 # Network error
}

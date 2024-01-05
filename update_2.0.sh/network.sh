#!/bin/bash


source log.sh
source distribution_detector.sh

networkcheck() { 

	while true; do

	# Multiple Use of ping to check connectivity to a reliable host
	for i in {1..3}; do # 3 times trial
	ping -c 4 www.google.com > /dev/null 2>&1

	if [[ $? -eq 0 ]]; then
		# Connectivity successfull
		log "Network connection verified"
		ping -c 4 "$update_host" > /dev/null 2>&1
		#if [[ $? -eq 0 ]]; then
			# Host server available for update
			#log "Host server available for update"
			return 0 # Success
		#else
			#log "Host server not available for update."
			#echo "Host server not available for update"
			#echo "Please try again later."
			#return 2
		#fi
	else
		sleep 5 # Wait before retry
	fi
done
		# Connectivity failed
		no_network=true
		while no_network=true; do
		echo "Network connection not available"
		echo "Please check your network connection"
		echo "Press enter to retry or 1 to exit"
		read -p	"choice : " choice
		case $choice in
			"") break ;;
			1) echo "Thanks and have a nice day!"; exit;;
			*) echo "Invalid option please press 1 to exit or enter to retry"
		esac
	done
done
}

networkcheck

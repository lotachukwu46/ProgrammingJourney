#!/bin/bash

# Source external feactures

source distribution_detector.sh
source update_packages.sh
source config.sh
source log.sh
source network.sh

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run with sudo or as root."
	read -p "Press enter to run with sudo or Q to quit." choice
	if [[ "$choice" =~ ^[Qq]$ ]]; then
		echo "Exiting script"
		exit 1
	elif [[ -z "$choice" ]]; then
		echo "running script
		sudo bash "$0" "$@"
	else
		echo "Enter Aa valid command"
		return
	fi
fi

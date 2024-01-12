#!/bin/bash

# Automated system updater
# Author: Lotachukwu odiegwu
# Version: 3.0
# Usage: Run with sudo/root privileges.
# Dependencies: distribution_detector.sh, update_packages.sh, config.sh, log.sh, network.sh

# Source external files
source distribution_detector.sh
source update_packages.sh
source config.sh
source log.sh
source network.sh

# Function to perform main update based on distribution
perform_update() {
	echo "detecting distribution"
	distribution_detect
	echo "checking network"
	networkcheck # Check network connectivity

    # Enhanced error handling
    trap 'error_handler "$BASH_COMMAND"' ERR

    case "${distribution,,}" in
        ubuntu|debian|kali|linuxmint)
            debian_based
            ;;
        arch)
            arch
            ;;
        centos|fedora|redhat)
            rpm_based
            ;;
        *)
            echo "Unsupported distribution: $distribution"
            log "Unsupported Distribution Detected: $distribution"
            exit 2
            ;;
    esac
    echo "End of updatefunction"
    #exit 0
}

# Root privilege check with informative messages
if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges to perform system updates."
    echo "Please run it using sudo or as root."
    read -p "Press enter to run with sudo or Q to quit." choice
        if [[ "$choice" =~ ^[Qq]$ ]]; then
                echo "Exiting script"
                exit 5 # No root previllages
        elif [[ -z "$choice" ]]; then
                echo "running script"
                sudo bash "$0" "$@"
        else
                # Invalid option display error
                echo "Invalid command"
                return
        fi
fi

# Sequential execution of core functions
#echo "detecting distribution"
#distribution_detect
#networkcheck
echo "performing update"
perform_update

echo "Update process complete."
echo "end of script"
exit 0

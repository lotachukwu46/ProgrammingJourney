#!/bin/bash

# This scrit is used to define the function used update the different distributions

# Source the distribution detector script to determine which update to be performed to be performed
# Source log file for documentation
source distribution_detector.sh
source log.sh

# Function for updating debian systems
debian_based() {

	# Capture commands for error traping
        trap 'error_handler "$BASH_COMMAND" ' ERR


	# Referesh package list
	echo "Refreshing package list"
	sudo apt upgrade -y >> update.log

	# While loop to enable reprompt of options unless choses to exit
	while true; do
		# Promt for different options
		echo "Choose the type of update you want to perform:"
		echo "1.Upgrade installed packages (keeps configurations)."
		echo "2.Full upgrade (may change configurations)."
		echo "3.Upgrade specific packages."
		echo "4.Upgrade to latest version of your distribution."
		echo "5.Install  packages."
		echo "6.Remove packages."
		echo "7.Purge packages (Remove complete)."
		echo "8.View available updates."
		echo "9.View package information."
		echo "10.Check for security updates."
		echo "11.to exit"
		
		# Collect user choice and perform operation
		read -p "Enter your choice (1-11)." choice

		# Check for the value of choice and perform operation accoroding to value
		case $choice in
			1)
				echo "Beginning upgrade"
				log "Beginning upgrade"
				sudo apt upgrade -y >> update.log
				echo "Upgrade complete"
				log "upgrade complete"
				;;
			
			2)
				echo "Beginning full upgrade"
				log "Beginning full upgrade"
				sudo apt full-upgrade -y >> update.log
				echo "Full upgrade complete"
				log "Full upgrade complete"
				;;
			
			3)
				read -p "Enter package name(s) to upgrade (seperated by space): " packages
				echo "Upgrading $packages"
				log "Upgrading $packages"
				sudo apt upgrade $packages -y >> update.log
				echo "$packages upgraded!"
				log "$packages upgraded"
				;;
				
			4)
				echo "Please advice to backup file before you continue"
				read -p "Do you want to continue press any key or 1 to exit and backup files" choice
				if [[ $choice == 1 ]]; then
					exit 1
				fi
				# Get available from do-release-upgrade
				available_versions=$(sudo do-release-upgrade -c | grep "New release" | cut -d ' ' -f4)
				echo "Available versions to upgrade to:"
				echo "$available_versions"
				
				echo "Enter distribution version to upgrade to or"
				read -p "or enter 'rollback' to revert to pervious os: " new_version
				
				if [[ $new_version == "rollback" ]]; then
					# Confirmation of roll back
					echo "Are you sure you want to roll back now"
					echo "Make sure you back up your files if u haven't press '1' to exit"
					read -p "or any other key to continue" choice
					if [[ $choice == 1 ]]; then
						exit 1
					fi
					echo "Beginning roll back"
					log "Beginning rollback"
					sudo do-release-upgrade --rollback -y  >> update.log
					log "Revert complete"
				else
					echo "Beginning upgrade to $new_version"
					log "Beginning upgrade to $new_version"
					
					sudo do-release-upgrade -d $new_version -y >> update.log
					echo "Completing upgrade to $new_version"
					log "Upgrade complete"
				fi
				;;
			
			5)
				read -p "Enter package name(s) to install (saperated by space): " packages
				echo "Beginning to update $packages
				log "beginning to update $packages
				sudo apt install $packages -y >> update.log
				log "$Packages installed"
				echo "$packages installed"
				;;
			
			6)
				
				read -p "Enter package name(s) to remove (separated by spaces): " packages
				echo "Are you sure you want to remove $package"
				read -p "Press 1 continue or any other key to go back" choice
				if [[ $choice == 1 ]]; then
					echo "Beginning to remove $packages"
					log "Beginning to remove $packages"
					sudo apt remove $packages -y >> update.log
					echo "$packages removed!"
					log "$packages removed"
				fi
				;;
			
			7)
				
				read -p "Enter package name(s) to purge (separated by spaces): " packages
				echo "Are you sure you want to comppletely remove $package"
				read -p "Press 1 continue or any other key to go back" choice
				if [[ $choice == 1 ]]; then
					echo "Beginning to remove $packages"
					log "Beginning to remove $packages"
					sudo apt purge $packages -y >> update.log
					echo "$Packages completely removed!"
					log "$packages completely removed!"
				fi
				;;
			8)
				echo "Available updates:"
				sudo apt list --upgradeable
				;;
			9)
				read -p "Enter package name to view information: " package
				echo "$package information:"
				apt show $package
				;;
			10)
				sudo apt update && apt list --upgradable
				;;
			11)
				log "Exiting debian function"
				echo "Good bye have a nice day"
				return 0 # Success
				;;
			*)
				echo "Invalid choice."
				;;
		esac
		
		read -p "Press enter to continue or q to quit" option
		if [[ "$option" == "Q" || "$option" == "q" ]]; then
			log "Existing debian function"
			return 0
		fi
	done

}

# Function for arch linux 
# The logic is similar to that of debian_based
arch() {

	# Capture commands for error traping
        trap 'error_handler "$BASH_COMMAND" ' ERR


	while true; do
		echo "Choose the type of update you want to perform:"
		echo "1. Full upgrade (pacman -Syu)"
		echo "2. Selective upgrade (pacman -Su)"
		echo "3. Install new packages"
		echo "4. Remove packages"
		echo "5. View available updates"
		echo "6. Check for security updates"
		echo "7. Exit"

		read -p "Enter your choice (1-7): " choice
		case $choice in
			
			1)
				sudo pacman -Syu
				log "Full upgrade complete"
				;;
			2)
				read -r -p "Enter package names to upgrade (separated by spaces): " packages
				sudo pacman -Su $packages
				log "$packages upgraded"
				;;
			3)
				read -r -p "Enter package names to install (separated by spaces): " packages
				sudo pacman -S $packages
				log "$packages installed"
				;;
            4)
                read -r -p "Enter package names to remove (separated by spaces): " packages
                sudo pacman -R $packages
                log "$packages removed"
                ;;
            5)
                sudo pacman -Qu
                ;;
            6)
                sudo pacman -Syu --ignore
                ;;
            7)
                log "Exiting Arch Linux update"
                return 0
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac

        read -p "Press Enter to continue or Q to quit." choice
        if [[ "$choice" == "Q" || "$choice" == "q" ]]; then
            log "Exiting Arch Linux update"
            return 0
        fi
    done
}

# Function for rpm_based system
# Same logic as debian_based
rpm_based() {

	# Capture commands for error traping
        trap 'error_handler "$BASH_COMMAND" ' ERR


    while true; do
        echo "Choose the type of update you want to perform:"
        echo "1. Full upgrade (dnf upgrade)"
        echo "2. Selective upgrade (dnf update)"
        echo "3. Install new packages"
        echo "4. Remove packages"
        echo "5. View available updates"
        echo "6. Check for security updates"
        echo "7. Exit"

        read -p "Enter your choice (1-7): " choice

        case $choice in
            1)
                sudo dnf upgrade
                log "Full upgrade complete"
                ;;
            2)
                read -r -p "Enter package names to upgrade (separated by spaces): " packages
                sudo dnf update $packages
                log "$packages upgraded"
                ;;
            3)
                read -r -p "Enter package names to install (separated by spaces): " packages
                sudo dnf install $packages
                log "$packages installed"
                ;;
            4)
                read -r -p "Enter package names to remove (separated by spaces): " packages
                sudo dnf remove $packages
                log "$packages removed"
                ;;
            5)
                sudo dnf check-update
                ;;
            6)
                sudo dnf upgrade --security
                ;;
            7)
                log "Exiting RPM-based update"
                return 0
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac

        read -p "Press Enter to continue or Q to quit." choice
        if [[ "$choice" == "Q" || "$choice" == "q" ]]; then
            log "Exiting RPM-based update"
            return 0
        fi
    done
}	

#!/bin/bash

# Update functions for different distributions
# Author: Lotachukwu Odiegwu
# Version: 1.0
# Usage: Source in update.sh
# Dependencies: distribution_detector.sh, log.sh


# This scrit is used to define the function used update the different distributions

# Source the distribution detector script to determine which update to be performed to be performed which was originnaly planned
# Source log file for documentation
source distribution_detector.sh
source log.sh

# Function for updating debian systems
debian_based() {

	# Capture commands for error traping
        trap 'error_handler "$BASH_COMMAND" ' ERR


	# Referesh package list
	echo "Refreshing package list"
	#sudo apt update -y >> update.log

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
				sudo apt upgrade -y >> update.log # Push the result to the log file
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
				break 
				# exit 0 # Success
				;;
			*)
				echo "Invalid choice."
				;;
		esac
		
		read -p "Press enter to continue or q to quit" option
		if [[ "$option" == "Q" || "$option" == "q" ]]; then
			log "Existing debian function"
			exit 0
		fi
	done

}

# Function for arch linux 
# The logic is similar to that of debian_based
arch() {
	

# Capture commands for error trapping
trap 'error_handler "$BASH_COMMAND" ' ERR
# Referesh package list
echo "Refreshing package list"
sudo pacman -Syyu >> update.log

# While loop to enable reprompt of options unless chosen to exit
while true; do
	# Prompt for different options (consistent with Debian-based)
	echo "Choose the type of update you want to perform:"
        echo "1. Upgrade installed packages (keeps configurations)."
        echo "2. Full upgrade (may change configurations)."
        echo "3. Upgrade specific packages."
	echo "4.Upgrade to latest version of your distribution."
	echo "5.Install  packages."
	echo "6.Remove packages."
	echo "7.Purge packages (Remove complete)."
	echo "8.View available updates."
	echo "9.View package information."
	echo "10.Check for security updates."
	echo "11. To exit"

        # Collect user choice and perform operation
        read -p "Enter your choice (1-11)." choice

        case $choice in
            1)
                echo "Beginning upgrade"
                log "Beginning upgrade"
                sudo pacman -Syu >> update.log
                echo "Upgrade complete"
                log "Upgrade complete"
                ;;

            2)
                echo "Beginning full upgrade"
                log "Beginning full upgrade"
                sudo pacman -Syyu >> update.log
                echo "Full upgrade complete"
                log "Full upgrade complete"
                ;;
	3)
		read -p "Enter package name(s) to upgrade (separated by space): " packages
		echo "Upgrading $packages"
		log "Upgrading $packages"
		sudo pacman -S $packages >> update.log
		echo "$packages upgraded!"
		log "$packages upgraded"
		;;
		
	4)
		echo "Beginning system upgrade"
		log "Beginning system upgrade"
		sudo pacman -Syu >> update.log
		echo "System upgrade complete"
		log "System upgrade complete"
		;;
	
	5)
		read -p "Enter package name(s) to install (separated by space): " packages
		echo "Beginning to install $packages"
		log "Beginning to install $packages"
		sudo pacman -S $packages >> update.log
		echo "$packages installed!"
		log "$packages installed"
		;;
	
	6)
		read -p "Enter package name(s) to remove (separated by spaces): " packages
		echo "Are you sure you want to remove $packages?"
		read -p "Press 1 to continue or any other key to go back" choice
		if [[ $choice == 1 ]]; then
			echo "Beginning to remove $packages"
			log "Beginning to remove $packages"
			sudo pacman -R $packages >> update.log
			echo "$packages removed!"
			log "$packages removed"
		fi
		;;
	
	7)
		
		read -p "Enter package name(s) to purge (remove completely) (separated by spaces): " packages
		echo "Are you sure you want to completely remove $packages?"
		read -p "Press 1 to continue or any other key to go back" choice
		if [[ $choice == 1 ]]; then
			echo "Beginning to remove $packages"
			log "Beginning to remove $packages"
			sudo pacman -Rns $packages >> update.log
			echo "$packages completely removed!"
			log "$packages completely removed!"
		fi
		;;
	
	8)
		echo "Available updates:"
		sudo pacman -Qu
		;;
	
	9)
		
		read -p "Enter package name to view information: " packages
		echo "$package information:"
		sudo pacman -Si $package
		;;
	10)
		echo "Security updates:"
		sudo pacman -Qu
		;;
	11)
		log "Exiting Arch function"
		echo "Good bye, have a nice day"
		exit 0  # Success
                ;;
	
	*)
		echo "Invalid choice."
                ;;
        esac

	read -p "Press Enter to continue or Q to quit." option
	if [[ "$option" == "Q" || "$option" == "q" ]]; then
            log "Exiting Arch function"
            exit 0
        fi
    done
}

# Function for rpm_based system
# Same logic as debian_based
rpm_based() {

    # Capture commands for error trapping
    trap 'error_handler "$BASH_COMMAND" ' ERR

    # Refresh package list
    echo "Refreshing package list"
    sudo dnf upgrade -y >> update.log

    # While loop to enable reprompt of options unless chooses to exit
    while true; do
        # Prompt for different options
        echo "Choose the type of update you want to perform:"
        echo "1. Upgrade installed packages (keeps configurations)."
        echo "2. Full upgrade (may change configurations)."
        echo "3. Upgrade specific packages."
        echo "4. Upgrade to the latest version of your distribution."
        echo "5. Install packages."
        echo "6. Remove packages."
        echo "7. Purge packages (remove completely)."
        echo "8. View available updates."
        echo "9. View package information."
        echo "10. Check for security updates."
        echo "11. To exit."

        # Collect user choice and perform operation
        read -p "Enter your choice (1-11): " choice

        # Check for the value of choice and perform operation according to value
        case $choice in
            1)
                echo "Beginning upgrade"
                log "Beginning upgrade"
                sudo dnf upgrade -y >> update.log
                echo "Upgrade complete"
                log "Upgrade complete"
                ;;

            2)
                echo "Beginning full upgrade"
                log "Beginning full upgrade"
                sudo dnf upgrade -y >> update.log
                echo "Full upgrade complete"
                log "Full upgrade complete"
                ;;

            3)
                read -p "Enter package name(s) to upgrade (separated by space): " packages
                echo "Upgrading $packages"
                log "Upgrading $packages"
                sudo dnf upgrade $packages -y >> update.log
                echo "$packages upgraded!"
                log "$packages upgraded"
                ;;

            4)
                echo "Please advise to backup files before you continue"
                read -p "Press any key or 1 to exit and backup files: " choice
                if [[ $choice == 1 ]]; then
                    exit 1
                fi
                # Get available versions from dnf system-upgrade
                available_versions=$(sudo dnf system-upgrade list-available | grep -Eo "[0-9]+")
                echo "Available versions to upgrade to:"
                echo "$available_versions"

                echo "Enter distribution version to upgrade to or"
                read -p "Enter 'rollback' to revert to the previous OS: " new_version

                if [[ $new_version == "rollback" ]]; then
                    # Confirmation of rollback
                    echo "Are you sure you want to roll back now?"
                    echo "Make sure you back up your files if you haven't. Press '1' to exit."
                    read -p "Press any other key to continue: " choice
                    if [[ $choice == 1 ]]; then
                        exit 1
                    fi
                    echo "Beginning rollback"
                    log "Beginning rollback"
                    sudo dnf system-upgrade download --rollback
                    sudo dnf system-upgrade reboot
                    log "Revert complete"
                else
                    echo "Beginning upgrade to $new_version"
                    log "Beginning upgrade to $new_version"
                    sudo dnf system-upgrade download --releasever=$new_version -y >> update.log
                    sudo dnf system-upgrade reboot
                    echo "Completing upgrade to $new_version"
                    log "Upgrade complete"
                fi
                ;;

            5)
                read -p "Enter package name(s) to install (separated by space): " packages
                echo "Beginning to update $packages"
                log "Beginning to update $packages"
                sudo dnf install $packages -y >> update.log
                log "$packages installed"
                echo "$packages installed"
                ;;

            6)
                read -p "Enter package name(s) to remove (separated by spaces): " packages
                echo "Are you sure you want to remove $packages?"
                read -p "Press '1' to continue or any other key to go back: " choice
                if [[ $choice == 1 ]]; then
                    echo "Beginning to remove $packages"
                    log "Beginning to remove $packages"
                    sudo dnf remove $packages -y >> update.log
                    echo "$packages removed!"
                    log "$packages removed"
                fi
                ;;

            7)
                read -p "Enter package name(s) to purge (separated by spaces): " packages
                echo "Are you sure you want to completely remove $packages?"
                read -p "Press '1' to continue or any other key to go back: " choice
                if [[ $choice == 1 ]]; then
                    echo "Beginning to remove $packages"
                    log "Beginning to remove $packages"
                    sudo dnf erase $packages -y >> update.log
                    echo "$packages completely removed!"
                    log "$packages completely removed!"
                fi
                ;;

            8)
                echo "Available updates:"
                sudo dnf list --upgradeable
                ;;

            9)
                read -p "Enter package name to view information: " package
                echo "$package information:"
                dnf info $package
                ;;

            10)
                sudo dnf check-update
                ;;

            11)
                log "Exiting RPM-based function"
                echo "Goodbye! Have a nice day."
                exit 0 # Success
                ;;

            *)
                echo "Invalid choice."
                ;;
        esac

        read -p "Press Enter to continue or 'q' to quit: " option
        if [[ "$option" == "Q" || "$option" == "q" ]]; then
            log "Exiting RPM-based function"
            exit 0
        fi
    done
}

# Designed by Lotacukwu

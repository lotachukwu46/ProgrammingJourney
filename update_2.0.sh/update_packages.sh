#!/bin/bash

# Update functions for different distributions
# Author: Lotachukwu Odiegwu
# Version: 1.0
# Usage: Source in update.sh
# Dependencies: log.sh


# This scrit is used to define
# The different function used update the different distributions

# Source log file for documentation

source log.sh

# Function for updating debian systems
debian_based() {

	# Capture commands for error traping
        trap 'error_handler "$BASH_COMMAND" ' ERR

	id="0"



	# Referesh package list
	echo "Refreshing package list"
#	 sudo apt update -y >> update.log

	# While loop to enable reprompt of options unless choses to exit
	while [[ $id -ne 1 ]]; do
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
		read -p "Enter your choice (1-11): " choice

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
				echo "Enter package name(s)"
				read -p "You wish to upgrade (seperated by space): " packages
				echo "Upgrading $packages"
				log "Upgrading $packages"
				sudo apt upgrade $packages -y >> update.log
				echo "$packages upgraded!"
				log "$packages upgraded"
				;;

			4)
				echo "Please advice to backup file before you continue"
				echo "Do you want to continue"
				read -p "press any key or 1 to exit and backup files" choice
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
				echo "Enter package name(s)"
				read -p "You wish to install (saperated by space): " packages
				echo "Beginning to update $packages
				log "beginning to update $packages
				sudo apt install $packages -y >> update.log
				log "$Packages installed"
				echo "$packages installed"
				;;

			6)

				echo "Enter package name(s)"
				read -p "You wish to remove (separated by spaces): " packages
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

				echo "Enter package name(s)"
				read -p " You wish to purge (separated by spaces): " packages
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
				id=1  # Success
				;;
			*)
				echo "Invalid choice."
				;;
		esac
	done

}

# Function for updating RPM-based systems
rpm_based() {

    # Capture commands for error trapping
    trap 'error_handler "$BASH_COMMAND" ' ERR

    id="0"

    # Refresh package list
    echo "Refreshing package list"
    sudo dnf update -y >> update.log

    # While loop to enable reprompt of options unless chooses to exit
    while [[ $id -ne 1 ]]; do
        # Prompt for different options
        echo "Choose the type of update you want to perform:"
        echo "1. Upgrade installed packages (keeps configurations)."
        echo "2. Full upgrade (may change configurations)."
        echo "3. Upgrade specific packages."
        echo "4. Install packages."
        echo "5. Remove packages."
        echo "6. Purge packages (Remove completely)."
        echo "7. View available updates."
        echo "8. View package information."
        echo "9. Check for security updates."
        echo "10. Exit"

        # Collect user choice and perform operation
        read -p "Enter your choice (1-10): " choice

        # Check for the value of choice and
	# Perform operation according to value
	# Then Push the activity to the log file
        case $choice in

            1)
                echo "Beginning upgrade"
                log "Beginning upgrade"
                sudo dnf upgrade -y >> update.log
                echo "Upgrade complete"
                log "upgrade complete"
                ;;

            2)
                echo "Beginning full upgrade"
                log "Beginning full upgrade"
                sudo dnf upgrade --best --allowerasing -y >> update.log
                echo "Full upgrade complete"
                log "Full upgrade complete"
                ;;

            3)
                echo "Enter package name(s)"
		read -p "You wish to upgrade (separated by space): " packages
                echo "Upgrading $packages"
                log "Upgrading $packages"
                sudo dnf upgrade $packages -y >> update.log
                echo "$packages upgraded!"
                log "$packages upgraded"
                ;;

            4)
                echo "Enter package name(s)"
		read -p "You wish to install (separated by space): " packages
                echo "Beginning to install $packages"
                log "Beginning to install $packages"
                sudo dnf install $packages -y >> update.log
                log "$packages installed"
                echo "$packages installed"
                ;;

            5)
                echo "Enter package name(s)"
		read -p "You to remove (separated by spaces): " packages
                echo "Are you sure you want to remove $packages"
                echo "Press 1 to continue"
		read -p "Or any other key to go back" choice
                if [[ $choice == 1 ]]; then
                    echo "Beginning to remove $packages"
                    log "Beginning to remove $packages"
                    sudo dnf remove $packages -y >> update.log
                    echo "$packages removed!"
                    log "$packages removed"
                fi
                ;;

            6)
                echo "Enter package name(s)"
		read -p "you wish to purge (separated by spaces): " packages
                echo "Are you sure you want to completely remove $packages"
                echo "Press 1 to continue"
		read -p "Or any other key to go back" choice
                if [[ $choice == 1 ]]; then
                    echo "Beginning to remove $packages"
                    log "Beginning to remove $packages"
                    sudo dnf remove $packages --allowerasing -y >> update.log
                    echo "$packages completely removed!"
                    log "$packages completely removed!"
                fi
                ;;

            7)
                echo "Available updates:"
                sudo dnf list --upgrades
                ;;

            8)
                read -p "Enter package name to view information: " package
                echo "$package information:"
                dnf info $package
                ;;

            9)
                sudo dnf check-update
                ;;

            10)
                log "Exiting RPM function"
                echo "Goodbye, have a nice day!"
                id=1  # Success
                ;;

            *)
                echo "Invalid choice."
                ;;
        esac
    done
}

# Function for updating Arch Linux systems
arch_linux() {

    # Capture commands for error trapping
    trap 'error_handler "$BASH_COMMAND" ' ERR

    id="0"

    # Refresh package list
    echo "Refreshing package list"
    sudo pacman -Syu --noconfirm >> update.log

    # While loop to enable reprompt of options unless chooses to exit
    while [[ $id -ne 1 ]]; do
        # Prompt for different options
        echo "Choose the type of update you want to perform:"
        echo "1. Upgrade installed packages."
        echo "2. Upgrade specific packages."
        echo "3. Install packages."
        echo "4. Remove packages."
        echo "5. View available updates."
        echo "6. View package information."
        echo "7. Exit"

        # Collect user choice and perform operation
        read -p "Enter your choice (1-7): " choice

        # Check for the value of choice
	# Then perform operation according to value
	# And push the updates result to the log file
        case $choice in

            1)
                echo "Beginning upgrade"
                log "Beginning upgrade"
                sudo pacman -Syu --noconfirm >> update.log
                echo "Upgrade complete"
                log "upgrade complete"
                ;;

            2)
                echo "Enter package name(s)"
		read -p "You wish to upgrade (separated by space): " packages
                echo "Upgrading $packages"
                log "Upgrading $packages"
                sudo pacman -S $packages --noconfirm >> update.log
                echo "$packages upgraded!"
                log "$packages upgraded"
                ;;

            3)
                echo "Enter package name(s)"
		read -p "You wish to install (separated by space): " packages
                echo "Beginning to install $packages"
                log "Beginning to install $packages"
                sudo pacman -S $packages --noconfirm >> update.log
                log "$packages installed"
                echo "$packages installed"
                ;;

            4)
                echo "Enter package name(s)"
		read -p "You wish to remove (separated by spaces): " packages
                echo "Are you sure you want to remove $packages"
                echo "Press 1 to continue"
		read -p "Or any other key to go back" choice
                if [[ $choice == 1 ]]; then
                    echo "Beginning to remove $packages"
                    log "Beginning to remove $packages"
                    sudo pacman -Rns $packages --noconfirm >> update.log
                    echo "$packages removed!"
                    log "$packages removed"
                fi
                ;;

            5)
                echo "Available updates:"
                sudo pacman -Qu
                ;;

            6)
                read -p "Enter package name to view information: " package
                echo "$package information:"
                pacman -Qi $package
                ;;

            7)
                log "Exiting Arch Linux function"
                echo "Goodbye, have a nice day!"
                id=1  # Success
                ;;

            *)
                echo "Invalid choice."
                ;;
        esac
    done
}
debian_based

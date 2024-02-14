#!/bin/bash

#check for root previlleges
if [ $EUID -ne 0 ];then
	echo "this script requires root previlleges."
	read -p "Do u want to run with sudo privillage.(y/n)" con
	if [[ "$con" =~ ^[Yy]$ ]]; then
		sudo bash "$0" "$@"
	else
		echo "exiting script"
		exit 1
	fi

fi

# define the logfile path
log_file="updatelog.txt"

#log function for consistent loging
log() {
	echo "$(date): $1" >> "$log_file"
}


#update function for Arch linux system
Arch() {
	log "identified Arch Linux"
	sudo pacman -syu --nonconfirm >> $log_file
}

#update for ubuntu/debian system
ubuntu() {

	# flag to track full upgrade confirmation
  full_upgrade_confirmed=false

	log "Identified ubuntu/debian"
	log "updating ubuntu/debian..."

	#prompt for updates (fetching list, upgrades, full upgrade)

	while true ; do
		echo "choose update option"
		echo "1: Fetch list only"
		echo "2: Upgrade packages"
		read -p "3: Full upgrade (caution: may include disruptive changes)): " choice
		case $choice in
			1)
				echo "fetching package lists.."
				sudo apt update -y >> $log_file
				log "package lisst fetched"
				break
				;;
			2)
				echo "upgrading packages ..."
				sudo apt upgrade -y >> $log_file
				log "package upgrades copleted"
				break
				;;
			3)
				if [[ $full_upgrade_confirmed == true ]]; then
					echo "Performing full upgrade...."
					sudo apt full-upgrade -y >> $log_file
					log "Full upgrade copleted"
					break
				fi
				#prompt for confirmation before full upgrade
				read -p "Confirm full upgrade (y/n)?" confirm
				if [[ "$confirm" =~ ^[Yy]$ ]]; then
					full_upgrade_confirmed=true
				else
					echo "full upgrade skipped!"
					log "full upgrade skipped"
					break
				fi
				;;
			*)
				echo "Invailed option. Please choose 1,2,3."
				;;
		esac
	done


	#Removing unnesseary packages
	if [[ $full_upgrade_confirmed == true ]]; then
		echo "Removing unnesscery packages..."
		sudo apt autoremove -y $log_file
		log "Removed unneccary packages"
	fi

}

#check for system type
if [ -d /etc/pacman.d ]
then
	#Arch linux
	Arch

elif [ -d/etc/apt ]
then
	#Debian/ubuntu
	ubuntu
else
	#unknown system
	log "Unknown system"
	read -p "Which OS is this (debian(d), ubuntu(u), arch Linux system(a)): " os
	case $os in
		[Dd] |[Uu])
			ubuntu
		;;
	[aA])
		Arch
		;;
	*)
		log "Unsupported OS: $os"
		echo "sorry this script only runs on ubuntu, debian or Arch Linux systems."
		exit 1
		;;
esac
fi
log "System upgrade finished"

exit 0

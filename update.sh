#!/bin/bash

# define the logfile path
log_file="update_log.txt"

#check for system type
if [ -d /etc/pacman.d ]
then
	#Arch Linux
	echo "$(date): Identified Arch Linux" >> $log_file
	sudo pacman -syu >> $log_file
elif [ -d/etc/apt ]
then
	#Debian/ubuntu
	echo "$(date): identifed Debian/ubuntu" >> $log_file
	sudo apt update >> $log_file
	sudo apt upgrade && sudo apt disk-upgrade >> $log_file
else
	#unknown system
	echo "$(date): unknown system" >> $log_file
	read -p "Which OS is this (debian(d), ubuntu(u), arch Linux system(a)): " os
	case $os in
		d | u)
			echo "$(date): user entered $os" >> $log_file
		sudo apt update >> $log_file
		sudo apt upgrade && sudo apt dist-upgrade >> $log_file
		;;
	a)
		echo " At $(date): User entered arch linux system" >> $log_file
		sudo pacman -syu >> $log_file
		;;
	*)
		echo "At $(date): Unsupported OS: $os" >> $log_file
		echo "sorry this script only runs on ubuntu, debian or Arch Linux systems."
		exit 1
		;;
esac
fi
echo "$(date): update finished" >> $log_file


	
       

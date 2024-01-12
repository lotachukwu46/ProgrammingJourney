#!/bin/bash

# read directory from user
read -p "enter an direcrory: " dir

# check if the directory name is empty
if [[ -z "$dir" ]]; then
	echo "please enter a valid directory name"
	exit 1
fi

# check if the direcrory exist
if  [ -d "$dir" ];then
	echo "the directory '$dir' already exists."
	exit 1
fi

# create the directory
mkdir "$dir" || {
	echo "Failed to create directory '$dir'."
exit 1
}

echo " A new dirctor has been created."

#confirm changing directory with user

read -p "Change directory to '$dir'? (y/n):" confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
	#change directory
	cd "$dir" || {
		echo "Failed to change directoy to '$dir'."
	exit 1
}
echo "your current directory is: $PWD"
else
	echo "Directory creation successful, but not switching directories."
fi
read -p "press enter to continue...."

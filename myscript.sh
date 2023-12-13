#!/bin/bash


read -p "enter an direcrory: " dir

if  [ -d "$dir" ] 
then
	echo " this dirctory exist."
else 
	echo " this directory dosen't exist let make it. "
	mkdir "$dir"
	echo " A new dirctor has been created"
fi 

echo "the value of pr: $dir"

cd "$dir" || exit 1
echo "your current directory is: $PWD"

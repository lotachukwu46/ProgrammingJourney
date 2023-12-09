#!/bin/bash

pr=/home/lotachukwu/us

if  [ -d "$pr" ] 
then
	echo " this dirctory exist."
else 
	echo " this directory dosen't exist let make it. "
	mkdir "$pr"
	echo " A new dirctor has been created"
fi 

echo "the value of pr: $pr"

cd "$pr" || exit # exit if cd fails
echo "your current directory is: $PWD"

#!/bin/bash

log() {
	local level="${1:-info}"
	local message="${@:2}"
	local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

	echo "[${timestamp}] 
	[${level}] ${message}" >> update.log
}

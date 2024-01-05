#!/bin/bash

# Function to handle errors
error_handler() {

        local error_message="$1"
        local error_line="${3:-$(caller)}" # Get line number or use caller if unavailable

        echo "An error occurred within ditribution_detect:"
        echo "Error message: $error_message"
        log "Error details: $error_message on line $error_line"

        # Check if the error is due to unsupported distribution
        if [[ "$error_message" = "unsupported distribution" ]]; then
                echo "Please try with a supported distribution"
                echo "supported distributions:"
                echo "Ubuntu"
                echo "Kali"
                echo "Debian"
                echo "Linuxmint"
                echo "Arch linux"
                echo "Fedora"
                echo "centos"
                echo "Redhat"
                exit 2 # exit code for unsupported os
        else
                echo "Existing script..."
                return 1 # Generic error exit code
        fi

}

log() {
        local level="${1:-info}"
        local message="${@:2}"
        local timestamp=$(date +"%Y-%m-%d %H:%M:%S")

        echo "[${timestamp}]
        [${level}] ${message}" >> update.log
}



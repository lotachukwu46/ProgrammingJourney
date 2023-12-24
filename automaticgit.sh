#!/bin/bash

git_push() {

	#display current branch and status
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	echo "current branch: $current_branch"
	git status

	read -p "Do you want to pull changes before pushing?(y/n): " pull_choice
	if [[ $pull_choice == ^[yY]$ ]]; then
		git pull || { echo "Pulling changes failed."; exit 1; }
	fi



	#list untracked files and modified files
	untrackedfiles=$(git ls-files --others --exclude-standard)

	#check if they are untracked files
	if [ -z "$untrackedfiles" ]; then
		echo "Untracked files:"
		echo "$untrackedfiles"
	else
		echo "No untracked files."
		return
	fi

	#Ask for file to add

	read -p "Enter the file you want to commit(or press enter add all files): " file
	if [[ -z "$file" ]]; then
		git add .
	else
		git add "$file"
	fi

	read -p "Enter a commit message or enter to use default: " message

	git commit -m "${message:-'Updated'}"

	git push
}

git_status() {

	#display current branch and status
	current_branch=$(git rev-parse --abbrev-ref HEAD)
	echo "Current branch: $current_branch"
	git status
}

git_pull() {

	read -p "Press ener to continue..."
		git pull
	if [[ $? -gt 0 ]]; then
		echo "Pulling changes not performed."
	fi
}

git_log() {
	# Display commit log
	git log
}

git_clone() {
	# Prompt for the repository URL
	read -p "Enter the repository HTTPS URL: " url

	# Prompt for destination directory
	read -p "Enter the directory you which to clone $url to: " dest_dir

	#  Perform cloning
	git clone "$url" "$dest_dir"

}

git_diff() {
	#show difference between working directory and last commit
	git diff
}

git_ignore() {
	# Open the default text editor to edit the .gitignorefile
	git config --global core.editor nano || git config --global core.editor vim
	git ignore
}

git_remote() {
    # List remote repositories
    git remote -v
}

git_config() {

	# Set Git configuration values
    read -p "Enter your name: " user_name
    read -p "Enter your email: " user_email

    git config --global user.name "$user_name"
    git config --global user.email "$user_email"
}

git_reset() {
	#prompt the user for the type of reset
	read -p "choose the type of reset (soft/mixed/hard): " reset

	# Check if there are any commits before attempting to reset
    if [ -z "$(git log -1)" ]; then
        echo "Cannot perform a reset in an empty repository."
        return
    fi
	read -p "Enter the commit to reset to (e.g.., HEAD): " commit

	# Perform the choosen reset
	git reset --$reset $commit
}

git_tag() {
    # Prompt the user to enter a tag name
    read -p "Enter a tag name: " tag_name

    # Check if there are any commits before attempting to tag
    if [ -z "$(git log -1)" ]; then
        echo "Cannot create a tag in an empty repository."
        return
    fi

    #prompt for commit reference 
    read -p "Enter the commit refrence for the tag (e.g., HEAD): " ref

    # Create a lightweight tag
    git tag -a $tag_name $ref -m "Tag: $tag_name"
    git tag
}

git_branch() {
    # List local branches
    git branch

    # Prompt the user to create a new branch
    read -p "Do you want to create a new branch? (y/n): " create_branch

    if [[ $create_branch == ^[yY]$ ]]; then
        read -p "Enter the new branch name: " new_branch
        git branch $new_branch
    fi
}

#git menu

while true; do

	echo "Automaticgit operations menu"
	echo "1. Push changes."
	echo "2. Pull changes."
	echo "3. Display status"
	echo "4. Clone repository."
	echo "5. View commit logs."
	echo "6. Show git diff."
	echo "7. Lists branches."
	echo "8. Lists remotes."
	echo "9. Create Tag."
	echo "10. Edit .gitignore."
	echo "11. Configure git."
	echo "12. Reset branch."
	echo "13. Exit."

	# Prompt for choice

	read -p "Enter the number for the operation you want to perform: " choice

	# Perform the choosen operation

	case $choice in
		1) git_push ;;
		2) git_pull ;;
		3) git_status ;;
		4) git_clone ;;
		5) git_log ;;
		6) git_diff ;;
		7) git_branch ;;
		8) git_remote ;;
		9) git_tag ;;
		10) git_ignore ;;
		11) git_config ;;
		12) git_reset ;;
		13) echo "Exiting, Goodbye!! and have a nice day!"; exit ;;
		*) echo "Invalid choice: $choice , pls form nomber 1 - 13 " ;;
	esac


	read -p "Press enter to continue..."

done



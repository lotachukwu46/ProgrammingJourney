import random

def get_choice():
    check = True
    while check == True:
        player_choice = input("Enter a choice(rock, paper, scissors): ").lower()
        if player_choice == 'rock' or player_choice == 'paper' or player_choice == "scissors":
            check = False
        else:
            print("Invalid choice try again!")
    options = ["rock", "paper", "scissors"]
    computer_choice = random.choice(options)

    choices = {
        "player": player_choice,
        "computer": computer_choice
    }

    return choices

def check_win(player, computer):
    print(f"You chose {player}, computer chose {computer}")
    if player == computer:
        return "It's a tie!"
    elif player == "rock":
        if computer == "scissors":
            return "Rock smashes scissors! You win!"
        else:
            return "Paper covers rock! you lose."
    elif player == "paper":
        if computer == "rock":
            return "Paper covers rock! you win!."
        else:
            return "Scissors cuts paper! you lose."
    elif player == "paper":
        if computer == "scissors":
            return "Scissors cuts paper! you Win!"
        else:
            return "Rock smashes scissors! You lose."

choices = get_choice()

result = check_win(choices["player"], choices["computer"])

print(result)
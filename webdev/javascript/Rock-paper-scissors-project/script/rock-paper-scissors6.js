let score = JSON.parse(localStorage.getItem('score')) || {
			wins: 0,
			losses: 0,
			ties: 0
		};

function resetScore() {
	score.wins = 0;
	score.losses = 0;
	score.ties = 0;
	localStorage.removeItem('score');
	updateScoreElement();
}

updateScoreElement();

let isAutoPlaying = false;
let intervalId;

/*const autoPlay() => {
};*/

function autoPlay() {
	if (!isAutoPlaying) {
		intervalId = setInterval(() => {
			const playerMove = pickComputerMove();
			playGame(playerMove);
		}, 1400);
		isAutoPlaying = true;
		document.querySelector('.js-autoPlay').innerHTML = 'Stop Auto Play';
		
	} else {
		clearInterval(intervalId);
		isAutoPlaying = false;
		document.querySelector('.js-autoPlay').innerHTML = 'Auto Play';
	}
}

document.querySelector('.js-rock-button')
	.addEventListener('click', () => {
		playGame('Rock');
	});

document.querySelector('.js-paper-button')
        .addEventListener('click', () => {
                playGame('Paper');
        });
document.querySelector('.js-scissors-button')
        .addEventListener('click', () => {
                playGame('Scissors');
        });

document.querySelector('.js-reset')
        .addEventListener('click', () => {
                resetScore();
        });

document.querySelector('.js-autoPlay')
        .addEventListener('click', () => {
                autoPlay();
        });


document.body.addEventListener('keydown', (event) => {

	if (event.key === 'r' || event.key === 'R') {
		playGame('Rock');
	} else if (event.key === 'p' || event.key === 'P') {
                playGame('Paper');
        } else if (event.key === 's' || event.key === 'S') {
                playGame('Scissors');
        }


});

function playGame(playerMove) {
	
	const computerMove = pickComputerMove();

	let result ='';

	if (playerMove === 'Scissors') {
		if (computerMove === 'Rock') {
			result = 'You lose.';
		} else  if (computerMove === 'Paper') {
			result = 'You win.';
		} else if (computerMove === 'Scissors') {
			result = 'Tie.';
		}


	} else if (playerMove === 'Paper') {
		if (computerMove === 'Rock') {
			result = 'You win.';
		} else  if (computerMove === 'Paper') {
			result = 'Tie.';
		} else if (computerMove === 'Scissors') {
			result = 'You lose.';
		}

	} else if (playerMove === 'Rock') {
		if (computerMove === 'Rock') {
			result = 'Tie.';
		} else  if (computerMove === 'Paper') {
			result = 'You lose.';
		} else if (computerMove === 'Scissors') {
			result = 'You win.';
		}
	}

	if (result === 'You win.') {
		score.wins++;
	} else if (result === 'You lose.') {
		score.losses++;
	} else if (result === 'Tie.') {
		score.ties++;
	}

	localStorage.setItem('score', JSON.stringify(score));

	updateScoreElement();

	document.querySelector('.js-result')
		.innerHTML = result;

	document.querySelector('.js-moves')
		.innerHTML = `You
		<img alt="${playerMove}" class="move-icon" src="images/${playerMove}-emoji.png">
		<img alt="${computerMove}" class="move-icon" src="images/${computerMove}-emoji.png">
		Computer`;
}

function updateScoreElement() {
	document.querySelector('.js-score')
		.innerHTML = `Wins: ${score.wins}, Losses: ${score.losses}, Ties: ${score.ties}`;
}

function pickComputerMove() {
	const randomNumber = Math.random();

	let computerMove = '';

	if (randomNumber >= 0 && randomNumber < 1 / 3) {
		computerMove = 'Rock';
	} else if (randomNumber >= 1 / 3 && randomNumber < 2 / 3 ) {
		computerMove = 'Paper';
	} else if (randomNumber >= 2 / 3 && randomNumber < 1) {
		computerMove = 'Scissors';
	}

	return computerMove;
}

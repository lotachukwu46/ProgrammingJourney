const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

let characterX = 50;
let characterY = canvas.height - 50;
let characterWidth = 20;
let characterHeight = 20;

function drawCharacter() {
	ctx.fillstyle = 'black';
	ctx.fillReact(characterX, characterY, characterWidth, characterHeight);
}

function gameLoop() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	drawCharacter();
	requestAnimationFrame(gameLoop);
}

gameLoop();

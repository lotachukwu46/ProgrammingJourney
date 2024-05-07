const todoList = JSON.parse(localStorage.getItem('todoList')) || [ ];
renderTodoList();

function renderTodoList() {

	let todoListHTML ='';

	todoList.forEach((todoObject, index) => {
		const { name, dueDate } = todoObject;

		const html = `
			<div>${name}</div>
			<div>${dueDate}</div>
			<button class="js-delete-todo-button delete-todo-button">Delete</button>
	`;

		todoListHTML += html;	
	});

	document.querySelector('.js-todo-list')
		.innerHTML = todoListHTML;

	document.querySelectorAll('.js-delete-todo-button')
		.forEach((deleteButton, index) => {
			deleteButton.addEventListener('click', () => {
				todoList.splice(index, 1);
				localStorage.removeItem('todoList');
				renderTodoList();
				localStorage.setItem('todoList', JSON.stringify(todoList));
			});
		});
	}

document.querySelector('.js-add-todo-button')
	.addEventListener('click', () => {
	addTodo();
})

function addTodo() {
	const inputElement = document.querySelector('.js-name-input');

	const name = inputElement.value;

	const dateInputElement = document.querySelector('.js-due-date-input');

	const dueDate = dateInputElement.value;


	todoList.push({
		name,
		dueDate,

	});

	inputElement.value = '';

	localStorage.setItem('todoList', JSON.stringify(todoList));

	renderTodoList();
}

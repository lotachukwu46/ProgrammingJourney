import tkinter as tk
from tkinter import messagebox
from datetime import datetime

def add_task():
    task_text = entry.get()
    if task_text:
        task_item = {
            "task_text": task_text,
            "start_date": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "end_date": "Not defined",
            "done": False
        }
        tasks.append(task_item)
        update_tasks()
        entry.delete(0, tk.END)

def delete_task(index):
    if messagebox.askyesno("Confirm Deletion", "Are you sure you want to delete this task?"):
        del tasks[index]
        update_tasks()

def toggle_task_done(index):
    tasks[index]["done"] = not tasks[index]["done"]
    update_tasks()

def update_tasks():
    for widget in frame.winfo_children():
        widget.destroy()

    for index, task in enumerate(tasks):
        task_frame = tk.Frame(frame, bg="#f0f0f0", pady=5)
        task_frame.pack(fill=tk.X)

        checkbox = tk.Checkbutton(task_frame, command=lambda index=index: toggle_task_done(index))
        checkbox.grid(row=0, column=0, padx=5)
        checkbox.select() if task["done"] else checkbox.deselect()

        task_label = tk.Label(task_frame, text=task["task_text"], bg="#f0f0f0")
        task_label.grid(row=0, column=1, padx=5)

        delete_button = tk.Button(task_frame, text="Delete", command=lambda index=index: delete_task(index), bg="#f44336", fg="white", relief=tk.FLAT)
        delete_button.grid(row=0, column=2, padx=5)

        start_label = tk.Label(task_frame, text="Started: " + task["start_date"], bg="#f0f0f0", fg="#888")
        start_label.grid(row=1, column=0, padx=5, sticky="w")

        end_label = tk.Label(task_frame, text="Ends: " + task["end_date"], bg="#f0f0f0", fg="#888")
        end_label.grid(row=1, column=1, padx=5, sticky="w")

root = tk.Tk()
root.title("To-Do List")
root.geometry("400x400")

tasks = []

entry = tk.Entry(root, width=50)
entry.pack(pady=10)

add_button = tk.Button(root, text="Add Task", command=add_task, bg="#4CAF50", fg="white", relief=tk.FLAT)
add_button.pack(pady=5)

frame = tk.Frame(root)
frame.pack(pady=10, fill=tk.BOTH, expand=True)

update_tasks()

root.mainloop()


import tkinter as tk
from tkinter import filedialog, messagebox
from tkinter import ttk

def open_file():
    file_path = filedialog.askopenfilename(title="Open File")

    if file_path:
        with open(file_path, "r") as file:
            text_widget.delete(1.0, tk.END)
            text_widget.insert(1.0, file.read())

def save_file():
    file_path = filedialog.asksaveasfilename(title="Save File", defaultextension=".txt")
    
    if file_path:
        with open(file_path, "w") as file:
            file.write(text_widget.get(1.0, tk.END))

def about():
    messagebox.showinfo("About", "Simple text editor\nCreated by Lotachukwu")



def main():
    root = tk.Tk()
    root.title("Text Editor")

    # Create a text widget
    global text_widget
    text_widget = tk.Text(root)
    text_widget.pack(expand=True, fill="both")

    menu_bar = tk.Menu(root)
    root.config(menu=menu_bar)

    file_menu = tk.Menu(menu_bar, tearoff=0)

    file_menu.add_command(label="Open", command=open_file)
    file_menu.add_command(label="Save", command=save_file)

    file_menu.add_separator()
    file_menu.add_command(label="Exit", command=root.quit)

    menu_bar.add_cascade(label="File", menu=file_menu)

    help_menu = tk.Menu(menu_bar, tearoff=0)

    help_menu.add_command(label="About", command=about)

    menu_bar.add_cascade(label="Help", menu=help_menu)


    root.mainloop()

if __name__ == "__main__":
    main()

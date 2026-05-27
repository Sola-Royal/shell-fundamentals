# shell-fundamentals

📋 Shell Fundamentals — Bash To-Do List Manager
A simple interactive To-Do List manager built with Bash scripting. Tasks are managed entirely from the terminal — no apps, no GUI, just pure shell scripting.
Author: Sola Ibinuolapo
GitHub: @Sola-Royal

📌 Features

✅ View all tasks with numbered lines <br>
✅ Add a new task<br>
✅ Delete a task by its number<br>
✅ Tasks are saved to ~/todo.txt and persist between sessions<br>
✅ Input validation (empty tasks and invalid numbers are rejected)<br>
✅ Runs in a loop until you choose to exit<br>


📁 Files
FileDescriptiontodo.shThe main bash script~/todo.txtAuto-created file where tasks are stored

🚀 How to Run
1. Clone the repository
bashgit clone https://github.com/Sola-Royal/shell-fundamentals.git
cd shell-fundamentals
2. Make the script executable
bashchmod +x todo.sh
3. Run the script
bash./todo.sh


## 1. Main Menu

<img width="797" height="266" alt="image" src="https://github.com/user-attachments/assets/40890e19-731f-463d-a861-eec8cf0f8f20" />



This is the main menu displayed every time the script runs. It shows 4 options: View tasks, Add a task, Delete a task, and Exit.

2. Adding a Task

<img width="568" height="357" alt="image" src="https://github.com/user-attachments/assets/ce4d6798-5999-4e43-8556-a4818fbed859" />


The user is prompted to type a new task. After pressing Enter, the task is saved to ~/todo.txt and a confirmation message is shown.

3. Viewing Tasks

![viewing_task](image.png)

All saved tasks are displayed with numbered lines using the nl command. The numbers are used to identify which task to delete.

4. Deleting a Task

I want to delete "do the lms assignment" which is number 2

- `before pressing 3 for delete number 2 on the list` 
![alt text](image-1.png)


- `After deleting it`
  ![alt text](image-2.png)

The user enters the number of the task they want to remove. The script uses sed -i to permanently delete that line from ~/todo.txt and confirms what was deleted.

5. Exiting the Program

![removing it](image-3.png)

When the user selects option 4, the script prints a goodbye message and exits cleanly using exit 0.

 ## What I Learned
Through this project, I learned how to write an interactive Bash script from scratch. Key concepts I practiced include:

Using variables to store file paths ($HOME, TODO_FILE)
Writing functions to organise reusable blocks of code
Using if statements with file tests (-f, -s, -z) to handle edge cases
Capturing user input with the read command
Appending to files with >> and deleting lines with sed -i
Validating input using regex with the =~ operator
Building a menu loop with while true and case statements


🛠 Technologies Used

Bash (Shell Scripting)
Linux Terminal
Git & GitHub

#!/bin/bash
 
# ─────────────────────────────────────────
#  todo.sh — Simple Interactive To-Do List
#  Tasks are stored in ~/todo.txt
# ─────────────────────────────────────────
 
TODO_FILE="$HOME/todo.txt"
 
# Create the file if it doesn't exist yet
if [ ! -f "$TODO_FILE" ]; then
    touch "$TODO_FILE"
fi
 
# ── Function: View all tasks ──────────────
view_tasks() {
    echo ""
    echo "============================="
    echo "       YOUR TASKS"
    echo "============================="
 
    if [ ! -s "$TODO_FILE" ]; then
        echo "  (No tasks yet. Add one!)"
    else
        nl -ba "$TODO_FILE"       # nl adds numbered lines
    fi
 
    echo "============================="
    echo ""
}
 
# ── Function: Add a new task ──────────────
add_task() {
    echo ""
    echo -n "Enter your new task: "
    read task                     # read captures user input
 
    if [ -z "$task" ]; then
        echo "⚠️  Task cannot be empty."
    else
        echo "$task" >> "$TODO_FILE"   # append task to file
        echo "✅ Task added: \"$task\""
    fi
    echo ""
}
 
# ── Function: Delete a task ───────────────
delete_task() {
    view_tasks
 
    if [ ! -s "$TODO_FILE" ]; then
        return
    fi
 
    echo -n "Enter the task number to delete: "
    read number                   # read the line number to delete
 
    # Validate: must be a positive integer
    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "⚠️  Please enter a valid number."
        echo ""
        return
    fi
 
    total=$(wc -l < "$TODO_FILE")
 
    if [ "$number" -lt 1 ] || [ "$number" -gt "$total" ]; then
        echo "⚠️  Task number out of range."
        echo ""
        return
    fi
 
    # Get the task text before deleting (for confirmation message)
    deleted_task=$(sed -n "${number}p" "$TODO_FILE")
 
    # sed -i deletes the line in-place
    sed -i "${number}d" "$TODO_FILE"
 
    echo "🗑️  Deleted task $number: \"$deleted_task\""
    echo ""
}
 
# ── Main loop ─────────────────────────────
while true; do
    echo "============================="
    echo "      TO-DO LIST MANAGER"
    echo "============================="
    echo "  1) View all tasks"
    echo "  2) Add a new task"
    echo "  3) Delete a task"
    echo "  4) Exit"
    echo "============================="
    echo -n "Choose an option [1-4]: "
    read choice
 
    case $choice in
        1) view_tasks ;;
        2) add_task ;;
        3) delete_task ;;
        4)
            echo ""
            echo "👋 Goodbye! Stay productive."
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo "⚠️  Invalid option. Please choose 1, 2, 3, or 4."
            echo ""
            ;;
    esac
done

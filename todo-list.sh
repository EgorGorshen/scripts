#!/bin/bash

todo_file="$HOME/.scripts/todo.txt"

if [ ! -f "$todo_file" ]; then
    touch "$todo_file"
fi

function add_task {
    task="$1"
    echo "$task" >> "$todo_file"
    echo "Задача добавлена в список."
}

function show_tasks {
    if [ -s "$todo_file" ]; then
        cat -n "$todo_file"
    else
        echo "Список задач пуст."
    fi
}

function delete_task {
    task=$(cat $todo_file | gum choose)
    sed -i -e "/${task/\//\\/}/d" "$todo_file"
    echo "Задача удалена из списка."
}

MOD=$(gum choose "1. Add" "2. Show" "3. Delete" "4. Exit")

case $MOD in
    "1. Add")
        task=$(gum input --placeholder "Task: ")
        add_task "$task"
        ;;
    "2. Show")
        show_tasks
        ;;
    "3. Delete")
        delete_task
        ;;
esac

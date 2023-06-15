#!/bin/bash

# Название основной ветки
main_branch="main"

# Вывести все ветки
branches=$(git branch -r | grep -v HEAD)

echo "Сравниваем ветки с основной веткой ($main_branch):"

# Итерация по каждой ветке
for branch in $branches
do
    echo "------------------------"
    echo "Ветка: $branch"
    
    # Получение разницы между текущей веткой и основной
    git diff --stat $main_branch $branch
    
    echo ""
done


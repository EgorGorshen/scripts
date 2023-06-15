#!/bin/bash

# Название основной ветки
main_branch="main"

# Вывести все ветки
branches=$(git branch -a | grep -v HEAD)

echo "Сравниваем ветки с основной веткой ($main_branch):"

# Итерация по каждой ветке
for branch in $branches
do
    echo "------------------------"
    echo "Ветка: $branch"

    # Получение списка изменений между текущей веткой и основной
    changes=$(git diff --name-status $main_branch $branch)

    if [ -z "$changes" ]; then
        echo "Ветка не содержит изменений."
    else
        # Вывод списка изменений
        echo "$changes"
    fi
    
    echo ""
done


#!/bin/bash

# Получаем список всех веток репозитория
branches=$(git branch -a | sed 's/^\*//')


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
    # Проверяем разницу в коде между текущей веткой и ее предшественником
    echo $(git diff HEAD^)

    echo "--------------------------------------------------"
    echo
    
    # Возвращаемся на предыдущую ветку
    echo $(git checkout - > /dev/null 2>&1)
done


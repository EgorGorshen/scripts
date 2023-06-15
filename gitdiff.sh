#!/bin/bash

# Находим текущую ветку
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Проходимся по всем веткам
for branch in $(git branch | cut -c 3-); do
    # Сравниваем ветку только если она не текущая
    if [ "$branch" != "$current_branch" ]; then
        echo "############################"
        echo "Differences from $current_branch to $branch:"
        # git diff --stat покажет статистику добавленных и удаленных строк по файлам
        git --no-pager diff --stat $current_branch..$branch
    fi
done


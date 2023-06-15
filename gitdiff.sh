#!/bin/bash

# Находим текущую ветку
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Проходимся по всем веткам
for branch in $(git branch | cut -c 3-); do
    # Сравниваем ветку только если она не текущая
    if [ "$branch" != "$current_branch" ]; then
        echo "############################"
        echo "Differences from $current_branch to $branch:"
        # git diff с параметром --diff-algorithm=histogram покажет изменения в формате, как при слиянии (merge)
        git --no-pager diff --diff-algorithm=histogram $current_branch..$branch
    fi
done


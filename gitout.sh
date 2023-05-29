#!/bin/bash

root_directory=$(pwd)

find "$root_directory" -type d -maxdepth 1 -exec sh -c '
    for dir do
        git -C "$dir" rev-parse >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "Репозиторий Git отсутствует: $dir"
        fi
    done
' sh {} +

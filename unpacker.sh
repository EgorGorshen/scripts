#!/bin/bash

# Получаем полный путь к текущей директории
current_dir=$(pwd)

# Если текущая директория совпадает с домашней, завершаем скрипт с сообщением об ошибке
if [ "$current_dir" == "$HOME" ]; then
    echo "Этот скрипт не должен запускаться в домашней директории!"
    exit 1
fi

# Перебираем все поддиректории и файлы в них, исключая скрытые директории и файлы
find . -path './.*' -prune -o -type f ! -name '.*' -print | while read file; do
    # Извлекаем базовое имя файла, чтобы избежать перезаписи файлов с одинаковыми именами
    basefile=$(basename "$file")

    # Проверяем, не существует ли уже файл с таким именем в корневой директории
    if [ ! -e "$basefile" ]; then
        # Если файла еще нет, перемещаем его
        mv "$file" "$basefile"
    else
        # Если файл уже существует, добавляем к имени файла временную метку, чтобы избежать конфликтов
        basefile=$(basename "$file" .$(echo "$file" | awk -F . '{if (NF>1) {print $NF}}'))
        extension=$(echo "$file" | awk -F . '{if (NF>1) {print $NF}}')
        timestamp=$(date +%Y-%m-%d_%H:%M:%S)
        mv "$file" "${basefile}_$timestamp.$extension"
    fi
done

# После перемещения всех файлов, находим и удаляем все пустые директории
find . -mindepth 1 -type d -empty -delete


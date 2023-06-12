#!/bin/bash

cd /Users/gorsenkovegor/Downloads/

# Перебираем все файлы в текущей директории
for file in *; do
  # Проверяем, является ли элемент файлом
  if [ -f "$file" ]; then
    # Получаем расширение файла
    extension="${file##*.}"

    # Создаем папку с именем расширения, если она еще не существует
    if [ ! -d "$extension" ]; then
      mkdir "$extension"
    fi

    # Перемещаем файл в соответствующую папку
    mv "$file" "$extension"
  fi
done



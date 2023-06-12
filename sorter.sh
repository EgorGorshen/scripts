#!/bin/bash

# Установим путь по умолчанию к папке Downloads
directory="$HOME/Downloads"

# Проверим, есть ли флаг -i
while getopts ":i" opt; do
  case ${opt} in
    i)
      # Если есть флаг -i, сортируем текущую директорию
      directory="$PWD"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done

# Переходим в выбранную директорию
cd "$directory"

# Перебираем все файлы в выбранной директории
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


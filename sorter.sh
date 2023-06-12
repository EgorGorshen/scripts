#!/bin/zsh

# Создаем папки, если они еще не существуют
mkdir -p картинки документы скрипты видео другое

# Проходимся по всем файлам в текущей директории
for file in *; do
    if [[ -f $file ]]; then
        # Получаем расширение файла в нижнем регистре
        ext="${file##*.}"
        ext_lower=${ext:l}

        # Перемещаем файл в соответствующую папку на основе расширения
        case $ext_lower in
            jpg|jpeg|png|gif)
                mv "$file" картинки/
                ;;
            pdf|doc|docx|txt|xlsx)
                mv "$file" документы/
                ;;
            sh|bash|zsh|py|cpp|c)
                mv "$file" скрипты/
                ;;
            mp4|avi|mov)
                mv "$file" видео/
                ;;
            *)
                mv "$file" другое/
                ;;
        esac
    fi
done


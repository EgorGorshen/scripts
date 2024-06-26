#!/bin/bash

# 1. имя проекта 
# 2. язык
# 3. если с/с++ то выбор форматирования
# 4. если python3 выбор venv/poetry
# 5. если с/с++ то CMakeList файл
# 6. добавление .gitignore
# 7. инициализация git 
# 8. git add . && git commit -am 'init $project_name'

function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}

PROJECT_NAME=$(gum input --placeholder "Project_name")
LANG=$(gum choose python3 cpp c) 

mkdir "$PROJECT_NAME" && cd "$PROJECT_NAME"

gi macos > .gitignore

if [ "$LANG" == 'c' ] || [  "$LANG" == 'cpp' ]; then
    ~/.local/share/nvim/mason/bin/clang-format --style=$(gum choose LLVM GNU Google Chromium Microsoft Mozilla WebKit) --dump-config > .clang-format
    gi c++ >> .gitignore
    gi c >> .gitignore
    
    cat ~/.scripts/Makefile > Makefile

    mkdir src
    touch main."$LANG"
fi

if [[ "$LANG" == 'python3' ]]; then

    ENV_TYPE=$(gum choose venv poetry)

    gi python >> .gitignore

    if [[ "$ENV_TYPE" == 'venv' ]]; then
        python3 -m venv ./.venv
        source ./.venv/bin/activate
        mkdir src
    fi

    if [[ "$ENV_TYPE" == 'poetry' ]]; then
        poetry init
        poetry shell
    fi

    touch main.py

fi

mkdir docs
echo "# $PROJECT_NAME" > README.md 
git init && git add . && git commit -am "init: project $PROJECT_NAME"

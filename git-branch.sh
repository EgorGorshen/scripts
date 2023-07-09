#!/bin/bash

TODO=$(gum choose "checkout" "remove" "add")

case "$TODO" in
    "checkout") git branch | cut -c 3- | gum choose | xargs git checkout
    ;;
    "remove") git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D
    ;;
    "add") git branch $(gum input --placeholder "Branch name")
    ;;
esac


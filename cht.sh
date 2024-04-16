#!/bin/zsh

languages=("python" "rust" "cpp" "c" "zig" "lua")
core_utils=("xargs" "mv" "find" "awk")

languages_str=$(printf "%s\n" "${languages[@]}")
core_utils_str=$(printf "%s\n" "${core_utils[@]}")

selected=$(printf "$languages_str\n$core_utils_str" | fzf)

echo -n "Enter your query: "
read query

if printf "%s\n" "${languages[@]}" | grep -qs "$selected"; then
    tmux neww bash -c "curl "cht.sh/$selected/$(echo $query | tr ' ' '+')" & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl "cht.sh/$selected~$query" & while [ : ]; do sleep 1; done"
fi


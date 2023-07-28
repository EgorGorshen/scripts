#!/bin/zsh

# TODO делать отделый cmake для папки src и tests и дальше их собирать вместе в корневой деррктории
# TODO Добавить заколовки в файла дерриктории tests 

if [[ ! -f $1 ]]; then
    echo "Configuration file not found: $1"
    exit 1
fi

# Parse YAML file and get values
version=$(yq e '.version' $1)
lib_on=$(yq e '.lib_on[]' $1)
fmt=$(yq e '.fmt' $1)

# Create project structure
mkdir -p bin src tests

echo "cmake_minimum_required(VERSION ${version})

project($(basename $(pwd)))

set(CMAKE_CXX_COMPILER /opt/homebrew/opt/llvm/bin/clang++)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/bin)

add_executable(main main.cpp)" > CMakeLists.txt

for lib in ${(f)lib_on}
do
    lib_upper=$(echo ${lib} | tr '[:lower:]' '[:upper:]')
    lib_dir="src/${lib}"
    if [[ ! -d ${lib_dir} ]]; then
        mkdir -p ${lib_dir}
    fi
    if [[ ! -f ${lib_dir}/${lib}.hpp ]]; then
        echo "#ifndef ${lib_upper}_HPP
#define ${lib_upper}_HPP

// Class declarations

#endif // ${lib_upper}_HPP" > ${lib_dir}/${lib}.hpp
    fi
    if [[ ! -f ${lib_dir}/${lib}.cpp ]]; then
        echo "#include \"${lib}.hpp\"

// Class definitions" > ${lib_dir}/${lib}.cpp
    fi
    echo "
add_library(${lib} ${lib_dir}/${lib}.cpp)
target_link_libraries(main ${lib})
" >> CMakeLists.txt
done

~/.local/share/nvim/mason/bin/clang-format --style=${fmt} --dump-config > .clang-format

touch main.cpp tests/tests.cpp tests/tests.hpp


TARGET=main
BUILD_DIR=build

PKGS=

COMPILER=clang++
FLAGS=-Wall -Wextra `pkg-config --cflags $(PKGS)`
LIBS=`pkg-config --libs $(PKGS)`

SRC_C=$(shell find . -name "*.c")
SRC_CXX=$(shell find . -name "*.cpp")

OBJ_C=$(patsubst %.c, $(BUILD_DIR)/%.o, $(SRC_C))
OBJ_CXX=$(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRC_CXX))

$(TARGET): $(OBJ_C) $(OBJ_CXX)
	$(COMPILER) $(OBJ_C) $(OBJ_CXX) -o $(TARGET)

$(BUILD_DIR)/%.o : %.c
	@mkdir -p $(dir $@)
	$(COMPILER) $(FLAGS) -c $< -o $@

$(BUILD_DIR)/%.o : %.cpp
	@mkdir -p $(dir $@)
	$(COMPILER) $(FLAGS) -c $< -o $@

clean :
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: clean


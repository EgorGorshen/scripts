TARGET=main
BUILD_DIR=build

COMPILER=clang++
FLAGS=-Wale -Wextra

SRC_C=$(shell find . -name "*.c")
SRC_CXX=$(shell find . -name "*.cpp")

OBJ_C=$(patsubst %.c, %.o, $(SRC_C))
OBJ_CXX=$(patsubst %.cpp, %.o, $(SRC_CXX))

$(TARGET): $(OBJ_C) $(OBJ_CXX)
	$(COMPILER) $(OBJ_C) $(OBJ_CXX) -o $(TARGET)


$(BUILD_DIR)/%.o : %.cpp %.c
	@mkdir -p $(dir $@)
	$(COMPILER) $(FLAGS) -c $< -o $@


clean :
	rm -rf $(BUILD_DIR) $(TARGET)

.PHONY: clean

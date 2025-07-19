EXECUTABLE	:= main
SRC_DIR				:= src
INCLUDE_DIR		:= include
LIB_DIR				:= lib
BUILD_DIR := build

CONAN_DIR := $(BUILD_DIR)/conan
CONAN_HOME_DIR := .conan2
CONAN_PROFILE := cpp17
CONAN_DEFINE_FLAG := -D
CONAN_INCLUDE_DIR_FLAG := -isystem
CONAN_LIB_DIR_FLAG := -L
CONAN_BIN_DIR_FLAG := -L
CONAN_LIB_FLAG := -l
CONAN_SYSTEM_LIB_FLAG := -l
include $(CONAN_DIR)/conandeps.mk

CXX		:= clang++
CXX_FLAGS := -Wall -Wextra -std=c++17 -g
DEFINES  := $(CONAN_DEFINES)
INCLUDES  := $(addprefix -I, $(INCLUDE_DIR)) $(CONAN_INCLUDE_DIRS)
LIB_DIRS := -L$(LIB_DIR) $(CONAN_LIB_DIRS)
LIBS := $(CONAN_LIBS)

all: $(BUILD_DIR)/$(EXECUTABLE)
	./$(BUILD_DIR)/$(EXECUTABLE)

$(BUILD_DIR)/$(EXECUTABLE): $(SRC_DIR)/*.cpp
	$(CXX) $(CXX_FLAGS) $(DEFINES) $(INCLUDES) $(LIB_DIRS) $^ -o $@ $(LIBS)

$(CONAN_HOME_DIR):
	-conan profile detect
	-conan config install .conan

$(CONAN_DIR)/conandeps.mk: conanfile.txt $(CONAN_HOME_DIR)
	-mkdir -p $(CONAN_DIR)
	-conan install . --output-folder=$(CONAN_DIR) --build=missing --profile:build=$(CONAN_PROFILE) --profile:host=$(CONAN_PROFILE)

clean:
	install -d $(BUILD_DIR)
	-rm -rf $(BUILD_DIR)/*

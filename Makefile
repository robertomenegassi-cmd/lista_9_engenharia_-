CXX = g++
CXXFLAGS = -Wall -std=c++11 -Iinclude -Isrc

SRC_DIR = src
BIN_DIR = bin
TEST_DIR = test

TARGET = $(BIN_DIR)/main.exe
TEST_TARGET = $(BIN_DIR)/testeRegressivo.exe

SRCS = $(wildcard $(SRC_DIR)/*.cpp)

OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BIN_DIR)/%.o, $(SRCS))

TEST_SRCS = $(filter-out $(SRC_DIR)/main.cpp, $(SRCS)) $(TEST_DIR)/main.cpp

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

testes:
	$(CXX) $(CXXFLAGS) $(TEST_SRCS) -o $(TEST_TARGET)

clean:
	rm -f $(BIN_DIR)/*.o $(BIN_DIR)/*.exe
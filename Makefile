## CREATED BY PRAKASH CHOUDHARY 
##	- Built for OpenCL v1.2
##  - Tested on AMD Radeon HD 6770 

CXX_FLAGS := -DCL_TARGET_OPENCL_VERSION=120 
CXX_FLAGS += -DCL_HPP_TARGET_OPENCL_VERSION=120
CXX_FLAGS += -DCL_HPP_MINIMUM_OPENCL_VERSION=120


CXX_FILES := $(wildcard ./src/util/*)
HXX_FILES := $(wildcard ./src/header/*)
TMP       := $(CXX_FILES:.cpp=.o)
OBJ_FILES := $(addprefix ./build/, $(notdir $(TMP)))

LIBS      := $(shell pkg-config --libs OpenCL)



main: $(CXX_FILES) $(HXX_FILES) $(OBJ_FILES) 
	@printf "Finally Building Main ... "
	@g++ ./src/main.cpp -o ./build/clminer 
	@printf "OK\n"

./build/util.o: ./src/header/util.hpp ./src/util/util.cpp
	@printf "Compiling & Building util ~> "
	@g++ -c ./src/util/util.cpp $(LIBS) $(CXX_FLAGS) -o ./build/util.o
	@printf "OK\n"

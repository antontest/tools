# version
CMAKE_MINIMUM_REQUIRED(VERSION 3.1)

#定义工程明
PROJECT(SOCKET)

# 指定编译器
SET(CMAKE_C_COMPILER "/home/anton/bin/clang/bin/clang")
SET(CMAKE_CXX_COMPILER "/home/anton/bin/clang/bin/clang++")
SET(CMAKE_AR "/usr/bin/llvm-ar")
SET(CMAKE_LINKER "/usr/bin/llvm-ld")
SET(CMAKE_NM "/usr/bin/llvm-nm")
SET(CMAKE_OBJDUMP "/usr/bin/llvm-objdump")
SET(CMAKE_RANLIB "/usr/bin/llvm-ranlib")

#ADD_SUBDIRECTORY告诉cmake去子目录找CMakeLists.txt文件
#其中：src为子目录，bin是执行文件的生成目录
ADD_SUBDIRECTORY(src src_bin)

#!/usr/bin/env bash

WORKSPACE_ROOT=${WORKSPACE:-${PWD}}
JOBS=30
# GCC
for GCC_VER in 4.8 5 6 7 8
do
export CC=`which gcc-${GCC_VER}`
export CXX=`which g++-${GCC_VER}`
export WORKSPACE=${WORKSPACE_ROOT}/gcc-${GCC_VER}

WORKSPACE=${WORKSPACE_ROOT}/gcc-${GCC_VER} CC=${CC} CXX=${CXX} ./all_py.sh

done

# LLVM
for CLANG_VER in 3.9 4.0 5.0 6.0 7 8
do

export CC=`which clang-${CLANG_VER}`
export CXX=`which clang-cpp-${CLANG_VER}` 

echo $CC
echo $CXX

done

#!/usr/bin/env bash

WORKSPACE_ROOT=${WORKSPACE:-${PWD}}
ICECC_BIN=${HOME}/opt/icecc/bin

# GCC
for GCC_VER in 4.8 5 6 7 8
do
export CC=${ICECC_BIN}/gcc-${GCC_VER}
export CXX=${ICECC_BIN}/g++-${GCC_VER}
export WORKSPACE=${WORKSPACE_ROOT}/gcc-${GCC_VER}

WORKSPACE=${WORKSPACE} CC=${CC} CXX=${CXX} ./all_py.sh

done

# LLVM
for CLANG_VER in 3.9 4.0 5.0 6.0 7 8
do

export CC=${ICECC_BIN}/clang-${CLANG_VER}
export CXX=${ICECC_BIN}/clang-cpp-${CLANG_VER}
export WORKSPACE=${WORKSPACE_ROOT}/clang-${CLANG_VER}

WORKSPACE=${WORKSPACE} CC=${CC} CXX=${CXX} ./all_py.sh

done

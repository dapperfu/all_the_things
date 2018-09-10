#!/usr/bin/env bash

BASH=`which bash`
BUILD_SCRIPT=${BUILD_SCRIPT:-${PWD}/pythons.sh}
WORKSPACE_ROOT=${WORKSPACE:-${PWD}}

# GCC
for GCC_VER in 4.8 5 6 7 8
do

export CC=`which gcc-${GCC_VER}`
export CXX=`which g++-${GCC_VER}`
export AR=`which gcc-ar-${GCC_VER}`
export WORKSPACE=${WORKSPACE_ROOT}/gcc-${GCC_VER}

${BASH} ${BUILD_SCRIPT} CC=${CC} CXX=${CXX} AR=${AR} WORKSPACE=${WORKSPACE}
done

# LLVM
for CLANG_VER in 3.9 4.0 5.0 6.0 7 8
do

export CC=`which clang-${CLANG_VER}`
export CXX=`which clang-cpp-${CLANG_VER}`
export AR=`which llvm-ar-${CLANG_VER}`
export WORKSPACE=${WORKSPACE_ROOT}/clang-${GCC_VER}

${BASH} ${BUILD_SCRIPT} CC=${CC} CXX=${CXX} AR=${AR} WORKSPACE=${WORKSPACE}
done

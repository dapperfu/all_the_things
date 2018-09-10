#!/usr/bin/env bash

WORKSPACE_ROOT=${WORKSPACE:-${PWD}}
OPENBLAS=${WORKSPACE_ROOT}/OpenBLAS
JOBS=6

rm -rf ${OPENBLAS}
git clone --depth=1 https://github.com/xianyi/OpenBLAS.git ${OPENBLAS}

# GCC
for GCC_VER in 4.8 5 6 7 8
do
cd ${OPENBLAS}
make clean

export CC=`which gcc-${GCC_VER}`
export CXX=`which g++-${GCC_VER}`
export PREFIX=${WORKSPACE_ROOT}/gcc-${GCC_VER}
CC=${CC} CXX=${CXX} make -j6

make PREFIX=${PREFIX} install
make clean
done

# LLVM
for CLANG_VER in 3.9 4.0 5.0 6.0 7 8
do
cd ${OPENBLAS}
make clean

export CC=`which clang-${CLANG_VER}`
export CXX=`which clang-cpp-${CLANG_VER}`
export PREFIX=${WORKSPACE_ROOT}/clang-${CLANG_VER}
CC=${CC} CXX=${CXX} make -j6

make PREFIX=${PREFIX} install
make clean
done

#!/usr/bin/env bash

export BUILD_SCRIPT=${PWD}/build_python.sh
export BASH=`which bash`
export CC=${CC:-`which clang-6.0`}
export CXX=${CXX:-`which clang-cpp-6.0`}
export AR=${AR:-`which llvm-ar-6.0`}

# Versions of Python to Build.
PYTHON_VERS="2.4.6 2.5.6 2.6.9 2.7.15 3.0.1 3.1.5 3.2.6 3.3.7 3.4.9 3.5.6 3.6.6 3.7.0"
# Compiler options.
for PYTHON_VER in ${PYTHON_VERS}
do
export PYTHON_VER=${PYTHON_VER}
${BASH} ${BUILD_SCRIPT} PYTHON_VER=${PYTHON_VER} CC=${CC} CXX=${CXX} AR=${AR}
done

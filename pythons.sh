#!/usr/bin/env bash

export BUILD_SCRIPT=${PWD}/build_python.sh
export BASH=`which bash`
export CC=${CC:-`which gcc-7`}
export CXX=${CXX:-`which g++-7`}
export AR=${AR:-`which gcc-ar-7`}

# Versions of Python to Build.
PYTHON_VERS="2.4.6 2.5.6 2.6.9 2.7.17 3.0.1 3.1.5 3.2.6 3.3.7 3.4.10 3.5.9 3.6.10 3.7.7 3.8.2"

PYTHON_VERS="3.5.9 3.6.10 3.7.7 3.8.2"
# Compiler options.
for PYTHON_VER in ${PYTHON_VERS}
do
export PYTHON_VER=${PYTHON_VER}
${BASH} ${BUILD_SCRIPT} PYTHON_VER=${PYTHON_VER} CC=${CC} CXX=${CXX} AR=${AR}
done

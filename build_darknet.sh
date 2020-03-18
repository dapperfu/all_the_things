#!/usr/bin/env bash

# Where to work
export WORKSPACE=${WORKSPACE:-/tmp}

# Darknet configuration
export OPENCV=${OPENCV:-0}
export OPENMP=${OPENMP:-0}
export GPU=${GPU:-0}
export CUDNN=${CUDNN:-${GPU}}

# Compiler
export CC=${CC:-`which clang-6.0`}
export CXX=${CXX:-`which clang++-6.0`}
export AR=${AR:-`which llvm-ar-6.0`}

# Darknet output
export BASENAME=${BASENAME:-`basename ${CC}`-${OPENCV}-${OPENMP}-${GPU}}
export EXEC=${EXEC:-darknet-${BASENAME}}
export SLIB=${SLIB:-libdarknet-${BASENAME}.so}
export ALIB=${SLIB:-libdarknet-${BASENAME}.a}

# Clone it
export DARKNET_DIR=${DARKNET_DIR:-${WORKSPACE}/darknet}
if [ ! -d "${DARKNET_DIR}" ]; then
	git clone git@github.com:jed-frey/darknet.git ${DARKNET_DIR}
fi

# Go there.
cd ${DARKNET_DIR}
# Cleanup
make clean
echo "**************************************"
echo "* Building darknet with:"
echo "* \${CC}=${CC}"
echo "* \${CXX}=${CXX}"
echo "* \${AR}=${AR}"
echo "* \${OPENMP}=${OPENMP}"
echo "* \${OPENCV}=${OPENCV}"
echo "**************************************"

# Set jobs
export JOBS=${JOBS:-8}

# TicToc
start_make=`date +%s.%N`
time make --jobs=${JOBS} --environment-overrides CC=${CC} CXX=${CXX} AR=${AR}
end_make=`date +%s.%N`
# Maths
make_time=$(echo "${end_make}-${start_make}" | bc)
# Pretty
echo "**************************************"
echo "* Build Results"
echo "* Make Time: ${make_time}s"
echo "**************************************"

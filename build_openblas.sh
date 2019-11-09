#!/usr/bin/env bash

. cfg.sh

# Compiler paths.
export CC=${CC:-`which clang-6.0`}
export CXX=${CXX:-`which clang-cpp-6.0`}
export AR=${AR:-`which llvm-ar-6.0`}

# Tool paths.
export MAKE=${MAKE:-`which make`}
export JOBS=${JOBS:-8}
export SH=`which sh`

# Base
export CLONE_URL=${CLONE_URL:-https://github.com/xianyi/OpenBLAS.git}
export CLONE_DEPTH=${CLONE_DEPTH:-0}
export CACHE_DIR=${CACHE_DIR:-/tmp}
# Local directory for Python source code.
export WORKSPACE_ROOT=${WORKSPACE:-${ROOT}}
export OPENBLAS_SRC=${WORKSPACE_ROOT}/OpenBLAS

# Don't hammer the download servers if it already exists.
if [ ! -d "${PYTHON_DIR}" ]; then
	curl -L ${PYTHON_URL} | tar xz --directory=${CACHE_DIR}
fi
cd ${PYTHON_DIR}
echo "**************************************"
echo "* Building OpenBLAS ${PYTHON_VER} with:"
echo "* \${CC}=${CC}"
echo "* \${CXX}=${CXX}"
echo "* \${AR}=${AR}"
echo "**************************************"

mkdir --parents ${PYTHON_ROOT}

start_configure=`date +%s.%N`
${SH} ${PYTHON_DIR}/configure --prefix=${PYTHON_ROOT} CC=${CC} CXX=${CXX} AR=${AR}
end_configure=`date +%s.%N`

start_make=`date +%s.%N`
${MAKE} install --jobs=${JOBS} --environment-overrides --directory=${PYTHON_DIR} CC=${CC} CXX=${CXX} AR=${AR}
end_make=`date +%s.%N`
cd ${ROOT}

configure_time=$(echo "${end_configure}-${start_configure}" | bc)
make_time=$(echo "${end_make}-${start_make}" | bc)
echo "**************************************"
echo "* Build Results"
echo "* Configure Time: ${configure_time}s"
echo "* Make Time: ${make_time}s"
echo "**************************************"

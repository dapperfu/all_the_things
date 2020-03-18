#!/usr/bin/env bash

export ROOT=${WORKSPACE:-${PWD}}

export CAFFE2_REPO=https://github.com/pytorch/pytorch.git
export CACHE_DIR=${CACHE_DIR:-/tmp}
export CAFFE2_DIR=${CACHE_DIR}/pytorch

# Don't hammer the download servers if it already exists.
if [ ! -d "${CAFFE2_DIR}" ]; then
git clone --branch v0.4.1 --depth 1 --recursive --recurse-submodules -j8 ${CAFFE2_REPO} ${CAFFE2_DIR}
fi

export PATH=/usr/local/cuda-9.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

export CC=${CC:-`which gcc-6`}
export CXX=${CXX:-`which g++-6`}
export AR=${AR:-`which gcc-ar-6`}

export GENERATOR=${GENERATOR:-Unix Makefiles}
export BUILD_DIR=${BUILD_DIR:-${ROOT}/caffe2_`basename ${CC}`_build}

rm -rf ${BUILD_DIR}
mkdir --parents ${BUILD_DIR}
cd ${BUILD_DIR}

cmake -G"${GENERATOR}" \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DUSE_NATIVE_ARCH=ON \
      -DUSE_NCCL=OFF \
      -DPYTHON_EXECUTABLE=`which python3` \
      -DCMAKE_AR=${AR} \
      -DCMAKE_ASM_COMPILER_AR=${AR} \
      -DCMAKE_CXX_COMPILER_AR=${AR} \
      -DCMAKE_C_COMPILER_AR=${AR} \
      -DCMAKE_C_COMPILER=${CC} \
      -DCMAKE_CXX_COMPILER=${CXX} \
      -DCMAKE_C_FLAGS="-I/usr/local/cuda-9.2/include -I/usr/local/cuda-9.2/include/crt" \
      -DCMAKE_CXX_FLAGS="-I/usr/local/cuda-9.2/include -I/usr/local/cuda-9.2/include/crt" \
      ${CAFFE2_DIR}


echo "**************************************"
echo "* Building caffe2 with:"
echo "* \${CC}=${CC}"
echo "* \${CXX}=${CXX}"
echo "* \${AR}=${AR}"
echo "**************************************"

make -j6
# ninja -j6

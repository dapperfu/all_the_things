#!/usr/bin/env bash

# With and Without GPU Support.
for GPU in 0 1
do
	export GPU=${GPU}
	export CUDNN=${CUDNN}

# With and Without OpenCV Support.
for OPENCV in 0
do
	export OPENCV=${OPENCV}

# With and Without OpenMP Support
for OPENMP in 0 1
do
	export OPENMP=${OPENMP}

# For each version of GCC
for GCC_VER in 4.8 5 6 7 8
do
	export CC=`which gcc-${GCC_VER}`
	export CXX=`which g++-${GCC_VER}`
	export AR=`which gcc-ar-${GCC_VER}`
# Build Darknet.
	./build_darknet.sh
done # endfor GCC_VER

# For each version of Clang
for CLANG_VER in 3.9 4.0 5.0 6.0 8
do
	export CC=`which clang-${CLANG_VER}`
	export CXX=`which clang++-${CLANG_VER}`
	export AR=`which llvm-ar-${CLANG_VER}`
# Build Darknet
	./build_darknet.sh
done # endfor CLANG_VER

done # endfor OPENMP

done # endfor OPENCV

done # endfor GPU

#!/usr/bin/env bash
DEBS=
# GCC
for GCC_VER in 4.8 5 6 7 8 9 
do
	DEBS+="gcc-${GCC_VER} g++-${GCC_VER} "
done
# LLVM
for CLANG_VER in 3.9 4.0 5.0 6.0 7 8
do
	DEBS+="clang-${CLANG_VER} "
done

echo ${DEBS}

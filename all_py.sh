#!/usr/bin/env bash
VERS="2.4.6 2.5.6 2.6.9 2.7.15 3.0.1 3.1.5 3.2.6 3.3.7 3.4.9 3.5.6 3.6.6 3.7.0"

export ROOT=${WORKSPACE:-${PWD}}
export BIN_ROOT=${WORKSPACE:-${PWD}}/opt
export PYTHON_ROOT=${BIN_ROOT}/python
export JOBS=${JOBS:-8}

for VER in ${VERS}
do
export URL=https://www.python.org/ftp/python/${VER}/Python-${VER}.tgz
cd ${ROOT}
curl -L ${URL} | tar xzv
cd Python-${VER}
./configure --prefix=${PYTHON_ROOT}
make install -j ${JOBS}
cd ${ROOT}
done

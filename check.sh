#!/usr/bin/env bash

export CC=${CC:-/dev/null}
export CXX=${CXX:-/dev/null}
export AR=${AR:-/dev/null}
export WORKSPACE=${WORKSPACE:-/dev/null}

echo \${MAKE}=${MAKE}
echo \${CC}=${CC}
echo \${CXX}=${CXX}
echo \${AR}=${AR}
echo \${WORKSPACE}=${WORKSPACE}


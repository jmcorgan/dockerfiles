#!/bin/sh
set -e
set -o nounset

. $HOME/.buildrc
export SRCDIR=/opt/gnuradio/src
export BUILDDIR=/opt/gnuradio/build
export GR_BUILD_OPTS=${GR_BUILD_OPTS:-x}
export EXCLUDE_TESTS=${EXCLUDE_TESTS:-x}
export CMAKE_DEFINES=${CMAKE_DEFINES:-x}

cd $BUILDDIR

if ! echo $GR_BUILD_OPTS | grep -q quick; then
    rm -rf $BUILDDIR/* &&
    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX $CMAKE_DEFINES $SRCDIR || {
        echo CMake failed!
        exit 1
    }
fi

make -j$NCORES -l$NCORES || {
    echo Compilation failed!
    exit 1
}

echo Excluding tests: $EXCLUDE_TESTS 

ctest -j$NCORES --output-on-failure -E $EXCLUDE_TESTS || {
    echo Tests failed!
    exit 1
}

make install || {
    echo Installation failed!
    exit 1
}

echo GNU Radio version $(gnuradio-config-info -v) completed.


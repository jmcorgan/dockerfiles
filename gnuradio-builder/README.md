This image can be executed to compile a GNU Radio source tree from
scratch, run the QA tests, and install the resulting build artifacts
into a externally mapped prefix directory.

It depends and builds upon jcorgan/gnuradio-builddeps, which contains
all the tools and development libraries needed. This image adds
configuration files and build scripts to accomplish these tasks.

Several external directories must be volume mapped into the container
for the builder to use. The host directories should be created with
permissions that allow the internal docker user to create and write to
files.

/home/user/.ccache  - should be mapped from a ccache directory,
                      possibly $HOME/.cache

/opt/gnuradio/src   - should be mapped from the source directory you
                      want to compile, such as $PWD/gnuradio

/opt/gnuradio/build - should be mapped from the host build directory
                      you wish to populated with the build
                      artifacts. This is optional, however if you do
                      not map this, then subsequent runs will start of
                      scratch.

/opt/gnuradio/inst  - should be mapped from the host directory you want
                      to act as the PREFIX for installation. This
                      should *not* be your actual host prefix, but
                      rather, as a directory that will later be used
                      in a runtime optimized container to hold the
                      installed GNU Radio software.


Several parts of the build are configurable through environment
variables:

GR_BUILD_OPTS - may be set to empty or to 'quick'. Using 'quick'
                reuses the cmake output and build tree from a previous
                run instead of compiling from scratch.

CMAKE_DEFINES - may be set to add additional parameters to the CMake
                invocation

NCORES        - may be set to the number of cores to use in parallel make

EXCLUDE_TESTS - may be set to a regex to match QA tests to ignore


An example run might look like:

$docker run -it --rm \
       -e GR_BUILD_OPTS= \
       -e EXCLUDE_TESTS='qtgui|zeromq|packet' \
       -e CMAKE_DEFINES='-DCMAKE_RELEASE_TYPE=Debug' \
       -e NCORES=8 \
       -v $PWD/ccache:/home/user/.ccache \
       -v $PWD/gnuradio:/opt/gnuradio/src \
       -v $PWD/build:/opt/gnuradio/build \
       -v $PWD/prefix:/opt/gnuradio/inst \
       jcorgan/gnuradio-builder 2>&1 | tee $PWD/run.log

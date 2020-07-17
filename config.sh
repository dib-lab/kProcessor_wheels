# Define custom utilities
# Test for OSX with [ -n "$IS_OSX" ]

function pre_build {

    echo "--------------PYVER--------------"
    echo $MB_PYTHON_VERSION
    python --version
    echo "---------------------------------"

#     rpm --import https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc
    
#     cat <<EOF > /etc/yum.repos.d/conda.repo
# [conda]
# name=Conda
# baseurl=https://repo.anaconda.com/pkgs/misc/rpmrepo/conda
# enabled=1
# gpgcheck=1
# gpgkey=https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc
# EOF


#     yum install conda

    # Any stuff that you need to do before you start building the wheels
    # Runs in the root directory of this repository.
    # build_swig
    
    # Prepare and install Anaconda

    # curl -o miniconda3.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    # chmod +x miniconda3.sh
    # sh miniconda3.sh -b -p /usr/local/miniconda3
    # export PATH=/usr/local/miniconda3/bin:$PATH
    # conda update --yes conda
    # conda create --yes -n test python=$MB_PYTHON_VERSION
    # source activate test
    # conda install --yes cmake
    # conda install --yes swig
    # cmake --version
    # cd hello_swig
    # mkdir build && cd build && cmake ..
    # make
    # cd ../..


    # Install anaconda

    # curl –O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    # sh Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
    # export PATH=" $HOME/miniconda3/bin:$PATH"
    # conda -V

    yum install bzip2 -y
    yum install cmake3 -y
    yum install make -y
    
    build_swig

    cd kProcessor
    rm -rf build
    mkdir build
    cd build
    cmake3 ..
    make
    cd ..
    # python setup.py bdist_wheel
    cd ..
}

# function pip_opts {
#     # Extra options for pip
#     # echo "--only-binary matplotlib --find-links ${MANYLINUX_URL}"
# }

function run_tests {
    # echo "tests"
    # # Runs tests on installed distribution from an empty directory
    # ASTROPY_INSTALL_DIR=$(dirname $(python -c 'import astropy; print(astropy.__file__)'))

    # # Patch the test_roundtrip_sky_rotation test which is affected by angle
    # # wrapping on 32-bit platforms. This should be fixed in astropy v4.0 with
    # # https://github.com/astropy/astropy/pull/9496
    # local patch_file=$(abspath ../patches/test_roundtrip_sky_rotation.patch)
    # (cd $ASTROPY_INSTALL_DIR && patch -p0 < $patch_file)

    # # Runs tests on installed distribution from an empty directory
    python --version
    # python -c "import sys; import swigHello; sys.exit(astropy.test(remote_data='none'))"
    pwd
    ls
}
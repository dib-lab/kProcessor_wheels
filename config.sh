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
    pip install --upgrade pip
    pip install cmake
    yum install zlib-devel -y
    yum install centos-release-scl-rh -y
    yum install devtoolset-7-toolchain -y
    yum groupinstall -y "development tools"
    yum install boost-devel -y
    yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel
    which gcc
    echo $(yum info cmake)
    yum install make -y
    echo $(python --version)
    
    build_swig

    cd kProcessor
    rm -rf build
    mkdir build
    cd build
    cmake ..
    make
    cd ..
    cd ..
}


function run_tests {
    python --version
    pwd
    ls
}
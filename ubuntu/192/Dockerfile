#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y \
            git \
            wget \
            unzip \
            gdb \
            g++-4.9 \
            automake \
            autoconf \
            autoconf-archive \
            libtool \
            libboost-all-dev \
            libevent-dev \
            libdouble-conversion-dev \
            libgoogle-glog-dev \
            libgflags-dev \
            liblz4-dev \
            liblzma-dev \
            libsnappy-dev \
            make \
            zlib1g-dev \
            binutils-dev \
            libjemalloc-dev \
            libssl-dev \
            python3 \
            libiberty-dev \
            libjsoncpp-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/wisechengyi/redex.git && \
    cd redex && \
    git checkout -f debug && \
    autoreconf -ivf && \
    ./configure CXX=/usr/bin/g++-4.9 && \
    make



# Define default command.
CMD ["bash"]

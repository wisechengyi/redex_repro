#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y git \
            g++ \
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
    autoreconf -ivf && ./configure && make

# Define default command.
CMD ["bash"]

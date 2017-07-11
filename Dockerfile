FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org

ENV container docker
LABEL RUN="docker run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /sys/fs/selinux:/sys/fs/selinux:ro -v /run:/run -v /var/log:/var/log -v /etc/localtime:/etc/localtime -v /:/host IMAGE"

RUN [ -e /etc/yum.conf ] && sed -i '/tsflags=nodocs/d' /etc/yum.conf || true

# Reinstall all packages to get man pages for them
# RUN yum -y reinstall "*" && yum clean all

RUN yum -y update
# RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install \
           git \
           wget

RUN git clone https://github.com/wisechengyi/redex.git && \
	cd redex && \
	git checkout -f debug

RUN yum -y install \
    gcc-c++ \
    automake \
    autoconf \
    autoconf-archive \
    libtool \
    lib \
    liblz4-dev \
    liblzma-dev \
    make \
    jsoncpp-devel \
    boost-devel \
    python34 \
    zlib-devel

RUN	autoreconf -ivf && ./configure && make

# Set default command
CMD ["/usr/bin/bash"]

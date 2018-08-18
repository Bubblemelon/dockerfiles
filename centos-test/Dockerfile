FROM centos:latest

RUN yum install -y make yum-utils dnf-plugins-core && \
    yum-builddep -y ostree && \
    yum clean all

RUN git clone https://github.com/ostreedev/ostree.git && \
    cd ostree  && \
    git checkout master && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

WORKDIR /ostree
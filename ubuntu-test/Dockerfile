FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install build-essential && \
    apt-get -y build-dep ostree && \
    apt-get install -y git 

RUN git clone https://github.com/ostreedev/ostree.git

RUN cd ostree && \
    git checkout master

RUN cd ostree && \
    ./autogen.sh && \
    make && \
    make install

RUN which ostree

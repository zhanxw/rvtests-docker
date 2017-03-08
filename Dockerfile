FROM alpine:latest

LABEL maintainer "Xiaowei Zhan <zhanxw@umich.edu>"

RUN apk update && apk add \
    # General
        wget \
    # Compiler
        gcc \
        g++ \
        gfortran \
        make \
        git
    # Library
        zlib-dev 

# Get source codes and build
RUN git clone https://github.com/zhanxw/rvtests.git && \
    cd rvtests && make

ENV PATH=/rvtests/executable:$PATH 

WORKDIR /rvtests

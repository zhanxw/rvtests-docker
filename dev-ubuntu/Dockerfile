FROM ubuntu:latest

LABEL maintainer "Xiaowei Zhan <zhanxw@umich.edu>"

RUN apt-get update && apt-get install -y \
    # General
        wget \
    # Compiler
        build-essential \
        gfortran \
        make \
        git \
    # Library
        zlib-dev \
    # Tools for automatic tests 
        r-base r-base-dev\
        python2.7 \
        bash
        
SHELL ["/bin/bash", "-c"]

#setup R configs
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('testthat')"
RUN Rscript -e "install.packages('mvtnorm')"

# Get and build RVTESTS
RUN git clone https://github.com/zhanxw/rvtests.git && \
    cd rvtests && make debug && \
    (for i in base libVcf regression;do make -C ${i}/test; make -C ${i}/test check; done;)

ENV PATH=/rvtests/executable/dbg:$PATH 

WORKDIR /rvtests

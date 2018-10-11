FROM ubuntu:16.04

LABEL maintainer "Xiaowei Zhan <zhanxw@umich.edu>"

# avoid interaction with tzdata
# https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    # General
        wget \
    # Compiler
        build-essential \
        gfortran \
        make \
        git \
    # Library
        zlib1g-dev \
    # Tools for automatic tests 
        r-base r-base-dev\
        python2.7 \
        bash && apt-get clean
        
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

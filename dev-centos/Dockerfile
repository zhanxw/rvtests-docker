FROM centos:latest

LABEL maintainer "Xiaowei Zhan <zhanxw@umich.edu>"

RUN yum -y install epel-release && yum -y update && yum -y install \
    # General
        wget \
        bzip2 \
    # Compiler
        gcc \
        g++ \
        gfortran \
        make \
        git \
    # Library
        zlib-devel \
    # Tools for automatic tests 
        R R-devel\
        python2 \
        bash && yum clean all
        
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

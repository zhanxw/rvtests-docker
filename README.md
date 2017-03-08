How to use
----------

For **an end user of RVTESTS**, 

    docker run --rm -ti zhanxw/rvtests-docker:latest /bin/sh

Then you can use `rvtest` to analyze your data.


For **developers of RVTESTS**,

    docker run --rm -ti zhanxw/rvtests-docker:dev /bin/sh

All executables are under `/rvtests/executable/dbg`.



Example
-------

Assume your phenotype file (pheno) and genotype files (example.vcf) are located under `/home/zhanxw/rvtests/example`.
First run docker:

    docker run --rm -ti -v /home/zhanxw/rvtests/example:/data zhanxw/rvtests-docker:latest /bin/sh


Then run the actual analysis:

    cd data; rvtest --pheno pheno --inVcf example.vcf --single wald --out out1

The result file `out1.SingleWald.assoc` is located under `/data` in Docker container and under `/home/zhanxw/rvtests/example` in your server.


For more information on how to use RVTESTS, please go to: https://github.com/zhanxw/rvtests

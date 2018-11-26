#! /usr/bin/bash

/home/ye/FastQC/fastqc --outdir ./out/  \
       --dir   ./out/tmp/ \
       --extract \
       -f   fastqc \
       -j /usr/bin/java \
       -t 4 \
       $1 $2


#!/usr/bin/bash

cutadapt  -a TCGTCGGCAGCGTCAGATGTGTATAAGAGACAG  -g GTCTCGTGGGCTCGGAGATGTGTATAAGAGACAG  -n 2 -o remove-adapter-R1.fastq -p remove-adapter-R2.fastq -m 50 -O 5 /home/ye/user/yejg/LEARN/Mapping/Data/E-3K-8_L4_Q809608.R1.clean.fastq.gz /home/ye/user/yejg/LEARN/Mapping/Data/E-3K-8_L4_Q809608.R2.clean.fastq.gz


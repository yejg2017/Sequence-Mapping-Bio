#!/usr/bin/bash

/home/ye/user/yejg/project/STAR-2.6.0a/source/STAR  --runThreadN 6 \
	--runMode alignReads \
	--readFilesType Fastx \
	--genomeDir ../Data/genomeindex/  \
        --readFilesIn  ../Adapter-removal/fastp/E-3K-8_L4_Q809608.R1.fq.gz   ../Adapter-removal/fastp/E-3K-8_L4_Q809608.R2.fq.gz  \
        --outFileNamePrefix ./aligned/E-3K-8_L4_Q809608-  \
	--outSAMtype BAM SortedByCoordinate \
        --outSAMunmapped Within \
        --outSAMattributes Standard \
	--sjdbOverhang  100 \
	--outFilterScoreMinOverLread 0 \
	--outFilterMatchNminOverLread  0 \
	--outFilterMatchNmin 0 \
	--outFilterMismatchNmax 2 \
	--readFilesCommand zcat
	 

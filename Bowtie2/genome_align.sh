OUT_DIR=$1
prefix=$2
OUTPUT=$OUT_DIR/$prefix.sam

/home/ye/bowtie2/bowtie2 -x ./genomeindex/reference  \
	-1 ../Adapter-removal/fastp/E-3K-8_L4_Q809608.R1.fq -2 ../Adapter-removal/fastp/E-3K-8_L4_Q809608.R2.fq \
	-S $OUTPUT

if [ $? -eq 0 ];then
echo "Samtools to transfer sam to bam"

/home/ye/samtools/samtools view -bS $OUTPUT > $OUT_DIR/$prefix.bam
/home/ye/samtools/samtools sort $OUT_DIR/$prefix.bam $OUT_DIR/$prefix-sorted.bam

fi

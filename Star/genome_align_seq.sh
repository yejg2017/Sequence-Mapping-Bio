FASTQ_SEQ=$1
GENOMEDIR=$2
OUTPUT=$3
#PREFIX=$3

for file in `ls $FASTQ_SEQ/*.gz `;
do
filename0=`basename $file`
filename=${filename0%.*}
if [ ! -e $OUTPUT/$filename ]
then
mkdir -p $OUTPUT/$filename
fi

cat > $OUTPUT/$filename/run.sh << EOF
/home/ye/user/yejg/project/STAR-2.6.0a/source/STAR --runThreadN 6 \
	--runMode alignReads \
	--readFilesType Fastx \
	--genomeDir $GENOMEDIR \
	--readFilesIn $file \
	--outFileNamePrefix $OUTPUT/$filename/Star- \
	--outSAMtype BAM SortedByCoordinate \
	--outSAMunmapped Within \
	--outSAMattributes Standard \
	--sjdbOverhang 100 \
	--outFilterScoreMinOverLread 0 \
	--outFilterMatchNminOverLread 0 \
	--outFilterMatchNmin 0 \
	--outFilterMismatchNmax 0 \
	--readFilesCommand zcat
EOF
chmod +x $OUTPUT/$filename/run.sh
nohup bash $OUTPUT/$filename/run.sh > log.txt &
done


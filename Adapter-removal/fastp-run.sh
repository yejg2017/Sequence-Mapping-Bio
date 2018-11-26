FASTQ_SEQ=$1
OUTPUT=$2
for file in `ls $FASTQ_SEQ/*.gz`
do
file1=`basename $file`	
filename_fq=${file1%.*}
filename=${filename_fq%.*}

if [ ! -e $OUTPUT/$filename ]
then
mkdir -p $OUTPUT/$filename
fi
cat > $OUTPUT/$filename/run.sh<< EOF
fastp -i $file -o $OUTPUT/$filename.fq.gz
EOF
chmod +x  $OUTPUT/$filename/run.sh
nohup bash  $OUTPUT/$filename/run.sh &
done

BAM_PATH=$1
GTF_PATH=$2
OUT_PATH=$3

for file in `ls $BAM_PATH/*/*.bam`
do 

filename0=`dirname $file`
filename1=`basename $filename0`
filename=${filename1%.*}

if [ ! -e $OUT_PATH/$filename ]
then
mkdir $OUT_PATH/$filename
fi
cat > $OUT_PATH/$filename/run.sh << EOF
htseq-count -f bam \
	-r name \
	-s yes \
	-t exon -i gene_id -m union \
	--quiet \
	$file $GTF_PATH
EOF

chmod +x $OUT_PATH/$filename/run.sh 
nohup bash $OUT_PATH/$filename/run.sh > $OUT_PATH/$filename/geneCount.txt &
done



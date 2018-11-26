#! /usr/bin/bash

PATH_DATA=$1  # data path( fastqc,bam etc)
THREADS=$2    # the number of threads
Fastqc=$3
CWD=`pwd`
OUT="$CWD/out"
TMP="$CWD/tmp"

if [ ! -d $OUT ];
then 
mkdir -p $OUT
fi

if [ ! -d $TMP ];
then
mkdir -p  $TMP
fi

# Loop over FASTQ files
for file in `ls $PATH_DATA/*.fastq`;do
	# Extract release, sample and FASTQ IDs
	release_id=`echo $file | cut -d '/' -f 9 | cut -d '.' -f 1`
	fastqc_id=`echo $file | cut -d '/' -f 9 | cut -d '.' -f 2`
	
	# Output directory
	OUTDIR="$OUT/fastqc_reports/$fastqc_id"
	TMPPATH="$TMP/fastqc_tmp/$fastqc_id"
	mkdir -p $OUTDIR
	mkdir -p $TMPPATH

	# Job building
	# Use release_id and fastqc_id as unique file identifier
	jobName=$CWD/qu_cmd/$release_id.$fastqc_id.fastqc.sh
	touch $jobName
	echo "#! /usr/bin/bash " > $jobName

	# Load fastqc in the parallele computing system in which the script will be run
	#echo " module `fastqc -version` " >> $jobName
	jobCmd="$Fastqc --outdir $OUTDIR --dir $TMPPATH -t $THREADS $file"
	echo $jobCmd >> $jobName

	# submit job
	chmod +x $jobName
	nohup /usr/bin/bash $jobName &
done





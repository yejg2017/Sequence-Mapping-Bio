htseq-count -f bam \
	-r name \
	-s yes \
	-t exon -i gene_id -m union \
	--quiet \
	/home/ye/user/yejg/LEARN/Mapping/Star/aligned/E-3K-8_L4_Q809608Aligned.sortedByCoord.out.bam  /home/ye/user/yejg/LEARN/Mapping/Data/GTFFile/Homo_sapiens.GRCh38.94.chr.gtf

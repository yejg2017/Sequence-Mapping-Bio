/home/ye/subread/bin/featureCounts -T 4 -s 2 \
	-a /home/ye/user/yejg/LEARN/Mapping/Data/GTFFile/Homo_sapiens.GRCh38.94.gtf \
	-o /home/ye/user/yejg/LEARN/Mapping/Star/featureCounts/E-3K-8_L4_Q809608_featureCounts.txt \
	/home/ye/user/yejg/LEARN/Mapping/Star/aligned/E-3K-8_L4_Q809608Aligned.sortedByCoord.out.bam \
	2> /home/ye/user/yejg/LEARN/Mapping/Star/featureCounts/featureCounts.screen-output.log

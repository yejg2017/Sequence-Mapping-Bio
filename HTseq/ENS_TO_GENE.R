library( org.Hs.eg.db ) 
library(AnnotationDbi) 


geneCounts<-read.csv("geneCounts.txt",head=F,sep="\t")
print(dim(geneCounts))

ENSG<-as.character(geneCounts[,1])
head(ENSG)


sysbols<-select(org.Hs.eg.db,ENSG, c("SYMBOL","GENENAME","ENTREZID"),"ENSEMBL")
#head(sysbols)

genes<-as.character(sysbols$SYMBOL)
geneCounts<-data.frame(gene=genes,counts=geneCounts[,2])
write.table(file="./geneCounts_GENE.txt",sep=" ",col.names=TRUE,row.names=FALSE)

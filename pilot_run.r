###

library(RiboDiPA)

#set to local directory
setwd('C://Gresham/Project_Carolino_new/ribodipa/pilot_data')

bam_file_list <- c("RPF_DGY1743_R1.10pct.bam", "RPF_DGY1743_R2.10pct.bam",
   "RPF_DGY1657_R1.10pct.bam", "RPF_DGY1657_R2.10pct.bam")
names.sample <- sub("(.*\\/)([^.]+)(\\.[[:alnum:]]+$)", "\\2", 
                    bam_file_list)
gtf_file <- c("Saccharomyces_cerevisiae.R64-1-1.50.gtf")

## Make the class label for the experiment
classlabel <- data.frame(
  condition = c("evolved", "evolved", "ancestor", "ancestor"),
  comparison = c(2, 2, 1, 1)
)
rownames(classlabel) <- names.sample

## Run the RiboDiPA pipeline with default parameters
result.pip <- RiboDiPA(bam_file_list, gtf_file, classlabel, cores = 2)



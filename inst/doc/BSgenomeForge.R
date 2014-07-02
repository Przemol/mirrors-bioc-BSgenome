### R code from vignette source 'BSgenomeForge.Rnw'

###################################################
### code chunk number 1: BSgenomeForge.Rnw:187-190
###################################################
library(Biostrings)
file <- system.file("extdata", "ce2chrM.fa", package="BSgenome")
fasta.info(file)


###################################################
### code chunk number 2: BSgenomeForge.Rnw:403-408
###################################################
library(BSgenome)
seed_files <- system.file("extdata", "GentlemanLab", package="BSgenome")
tail(list.files(seed_files, pattern="-seed$"))
rn4_seed <- list.files(seed_files, pattern="\\.rn4-seed$", full.names=TRUE)
cat(readLines(rn4_seed), sep="\n")


###################################################
### code chunk number 3: BSgenomeForge.Rnw:421-424 (eval = FALSE)
###################################################
## library(BSgenome)
## #forgeBSgenomeDataPkg("path/to/my/seed", mode="fa.rz")  # not ready yet
## forgeBSgenomeDataPkg("path/to/my/seed", mode="rda")


###################################################
### code chunk number 4: BSgenomeForge.Rnw:653-658
###################################################
library(BSgenome)
seed_files <- system.file("extdata", "GentlemanLab", package="BSgenome")
tail(list.files(seed_files, pattern="\\.masked-seed$"))
rn4_masked_seed <- list.files(seed_files, pattern="\\.rn4\\.masked-seed$", full.names=TRUE)
cat(readLines(rn4_masked_seed), sep="\n")


###################################################
### code chunk number 5: BSgenomeForge.Rnw:673-675 (eval = FALSE)
###################################################
## library(BSgenome)
## forgeMaskedBSgenomeDataPkg("path/to/my/seed")


###################################################
### code chunk number 6: BSgenomeForge.Rnw:717-718
###################################################
sessionInfo()



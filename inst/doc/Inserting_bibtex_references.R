### R code from vignette source 'Inserting_bibtex_references.Rnw'

###################################################
### code chunk number 1: Inserting_bibtex_references.Rnw:55-57
###################################################
library(Rdpack)
pd <- packageDescription("Rdpack")


###################################################
### code chunk number 2: Inserting_bibtex_references.Rnw:238-240
###################################################
library(Rdpack)
cat(insert_ref("R", package = "bibtex"), sep ="\n")



library(dplyr)
library(snow)
library(MonteCarlo)
library(pcalg)
library(ggplot2)
library(tibble)
library(boot)
library(magrittr)
library(ggpubr)
library(bootstrap)
library(assertthat)
library(partitions)
library(parallel)

data(law)

n = 15
Weak.Compositions = compositions(n,n)


No.Compositions = dim(Weak.Compositions)[2]

compelete.enumeration = lapply(1:No.Compositions, function(i) {
  com.samples = Weak.Compositions[,i]
  law.list = lapply(1:n,function(j) matrix(rep(law[j,],com.samples[j]),ncol = 2 ,byrow = TRUE))
  new.samples = do.call(rbind, law.list)
  c(cor(unlist(new.samples[,1]),unlist(new.samples[,2])),dmultinom(com.samples,prob = rep(1,n)))
})
compelete.enumeration = t(simplify2array(compelete.enumeration))
colnames(compelete.enumeration) = c("P_Value.cor","W")
save(compelete.enumeration,file = "compelete.enumeration.Rdata")  


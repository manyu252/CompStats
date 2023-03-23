library("bootstrap")
library("assertthat")
library("partitions")
library(parallel)
data(law)

produce.sample = function() {
  n = dim(law)[1]
  samples = sample(n,replace = TRUE)
  return(cor(law[samples,]$LSAT,law[samples,]$GPA))
}

repetition = 40000
bootstrap.cor = replicate(repetition, produce.sample())

hist(bootstrap.cor, breaks = 1000)
summary(bootstrap.cor)
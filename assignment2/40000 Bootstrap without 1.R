library("dplyr")
library("MonteCarlo")
library("pcalg")
library("ggplot2")
library("tibble")
library("boot")
library("magrittr")
library("ggpubr")
Base_Data <- read.csv("D:/DSDM/1st Semester/Computational Statistics/Assignment/Law.csv", header= TRUE)
Function_Bootstrap <- function(data, i){
  Pool_Data <- data[i,]
  return(cor(Pool_Data$LSAT, Pool_Data$GPA))
}

set.seed(1)
bootstrap_correlation <- boot(Base_Data,Function_Bootstrap,R=40000)
plot(bootstrap_correlation)
summary(bootstrap_correlation)

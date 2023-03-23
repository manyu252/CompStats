library("dplyr")
library("MonteCarlo")
library("pcalg")
library("ggplot2")
library("tibble")
library("boot")
library("magrittr")
library("ggpubr")

Base_Data <- read.csv("D:/DSDM/1st Semester/Computational Statistics/Assignment/Law.csv", header= TRUE)

MC.P_VALUE.LIST <- list()

for (i in 1:40000) {
  
  
  
  MC_Samples <- sample_n(Base_Data, 15, replace = FALSE)
  P_VALUE <- cor(MC_Samples$LSAT,MC_Samples$GPA, method = 'pearson')
  MC.P_VALUE.LIST[[i]] <- P_VALUE
}
MC.p_Value.List.Final <- unlist(MC.P_VALUE.LIST, use.names = FALSE)
hist(MC.p_Value.List.Final, breaks = 100, freq = FALSE)
summary(MC.p_Value.List.Final)
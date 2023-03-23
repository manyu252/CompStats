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

Base_Data <- read.csv("D:/DSDM/1st Semester/Computational Statistics/Assignment/Law.csv", header= TRUE)

OLS <- lm( GPA ~ LSAT, Base_Data)

plot(GPA ~ LSAT, Base_Data)
abline(OLS, col="blue")

typeof(Base_Data)

summary(OLS)

OLS[["residuals"]]


library("pcalg")
data<- read.table(file="D:/data.csv", header=TRUE,sep = "," )
n <- nrow (data)
V <- colnames(data) # labels aka node names
## estimate CPDAG
pc.fit <- pc(suffStat = list(C = cor(data), n = n),
             indepTest = gaussCItest, ## indep.test: partial correlations
             alpha=0.01, labels = V,NAdelete = TRUE, verbose = TRUE, solve.confl = FALSE)
if (require(Rgraphviz)) {
  ## show estimated CPDAG
  par(mfrow=c(1,2))
  plot(pc.fit, main = "Estimated CPDAG")
}

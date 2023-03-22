library("pcalg")
data<- read.table(file="D:/data.csv", header=TRUE,sep = "," )
n <- nrow (data)
V <- colnames(data) # labels aka node names
My.FCI<- fci(suffStat = list(C = cor(data), n=n),
    indepTest = gaussCItest, alpha=0.001, labels= V,
    skel.method = "stable",
    type = "normal",
    fixedGaps = NULL, fixedEdges = NULL,
    NAdelete = TRUE, m.max = Inf, pdsep.max = Inf,
    rules = rep(TRUE, 10), doPdsep = FALSE, biCC = FALSE,
    conservative = TRUE, maj.rule = FALSE,
    numCores = 1, selectionBias = TRUE,
    jci = c("0","1","12","123"), contextVars = NULL,
    verbose = TRUE)
FCIMATRIX<- summary(My.FCI)
plot(My.FCI)

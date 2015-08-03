library(psych)

data <- read.csv('~/remota/repos/own/usp/archive/2015/boxplot_poluentes/safra_conf.csv',dec=',')

boxplot(data, main="mediana, CI etc para poluente X",
        xlab="ug/m3", 
        ylab="Período",
        col = "lightgreen")

error.bars(data,add=TRUE)
abline(h=0)


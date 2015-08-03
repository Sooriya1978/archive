data <- read.csv('~/remota/repos/own/usp/archive/2015/boxplot_poluentes/safra_conf.csv',dec=',')

boxplot(data, main="Média, mediana, CI etc para poluente X",
        xlab="ug/m3", 
        ylab="Período") 


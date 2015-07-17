ar <- data.frame(ozone=rnorm(120,2),solar=rnorm(120,4),mes=gl(12,10)) # cria os dados para teste
s<-split(ar,ar$mes) # retorna uma lista por mes
lapply(s,function(x) colMeans(x[,c("ozone","solar")])) #retorna lista
sapply(s,function(x) colMeans(x[,c("ozone","solar")],na.rm=TRUE)) #retorna uma matriz, ou o que a função sapply julgar melhor
	



getwd()
setwd("~/Dropbox/estudos/ead/coursera/stastaticsOne/R")
library(psych)
library(sm) # para usar a função densidade
search() # ver pacotes carregados
impact<-read.table("Lab2.txt",header=T)
View(impact)

dim(impact)
names(impact)
class(impact$verbal_memory_retest)
class(impact$condition)

#mudar a classe do subject
class(impact$subject)
impact$subject<-factor(impact$subject)
class(impact$subject)

describe(impact)
describeBy(impact,impact$condition)

control<-subset(impact,impact[,2]=="control")
concussed<-subset(impact,impact[,2]=="concussed")

#histograma
par(mfrow=c(2,3)) # Colocar todas figuras em uma página
hist(control[,3])
hist(control[,4])
hist(control[,5])
hist(control[,6])
hist(control[,7])
hist(control[,8])

#simulação,ajuste
par(mfrow=c(1,2))
hist(concussed[,14])
plot(density(concussed[,14]))

par(mfrow=c(1,1))
sm.density.compare(impact$total_symptom_retest,impact$condition)
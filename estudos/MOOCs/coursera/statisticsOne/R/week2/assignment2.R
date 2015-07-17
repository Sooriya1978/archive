getwd()
setwd("~/Dropbox/estudos/ead/coursera/stastaticsOne/R")
library(psych)
library(sm) # para usar a função densidade

memory<-read.table("assignment2.txt",header=T)
#View(memory)
nrow(memory)
mean(memory$SR)
var(memory$SR)# é igual ao desvio ao quadradro
sd(memory$SR)

pre<-subset(memory,memory$time=='pre')
mean(pre$SR)

pos<-subset(memory,memory$time=='post')
sd(pos$SR)
median(pos$SR)

describeBy(pos,pos$condition)
par(mfrow=c(2,3))
hist(subset(memory,memory$time=='pre' & memory$condition=='DS')$SR)
hist(subset(memory,memory$time=='pre' & memory$condition=='PE')$SR)
hist(subset(memory,memory$time=='pre' & memory$condition=='WM')$SR)
hist(subset(memory,memory$time=='post' & memory$condition=='DS')$SR)
hist(subset(memory,memory$time=='post' & memory$condition=='PE')$SR)
hist(subset(memory,memory$time=='post' & memory$condition=='WM')$SR)


describeBy(memory,memory$condition)

median(subset(memory,memory$time=='post' & memory$condition=='PE')$SR)
mean(subset(memory,memory$time=='post' & memory$condition=='PE')$SR)
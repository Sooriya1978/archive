hw2=read.table(file="hw2.csv",sep=",",dec=".",header=T)
stat = summary(hw2[,1],digits=7)
summary(hw2[,1],digits=7)
iqr =stat[5] - stat[2]
iqr
mean(log(hw2[,1]))
log(mean(hw2[,1]))
sqrt(var(hw2[,1]))
sqrt(var(hw2[,1])/length(hw2[,1]))
mean(hw2[,1])
ci_min= mean(hw2[,1]) - 2*sqrt(var(hw2[,1])/length(hw2[,1]))
ci_max=mean(hw2[,1]) + 2*sqrt(var(hw2[,1])/length(hw2[,1]))

Du = stat[5]- stat[3] 
Di = stat[3]- stat[2] 
Du
Di
boxplot(hw2[,1])
stem(hw2[,1])
stem(log10(hw2[,1]))

boxplot(hw2[,2],hw2[,3])
boxplot(hw2[,3])
boxplot(hw2[,2])


log10(summary(hw2[,2]))
summary(log10(hw2[,2]))
summary(log10(hw2[,3]))
log10(summary(hw2[,3]))
summary(hw2[,2])
summary(hw2[,3])
names(hw2)

sd(hw2[,2])/sqrt(length(hw2[,2]))
sd(hw2[,3])/sqrt(length(hw2[,3]))
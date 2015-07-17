setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week7")
library(psych)
library(ggplot2)
library(multilevel)
list.files()
mod<-read.table("data1.txt",header=T)
View(mod)
describeBy(mod,mod$condition)

model0<-lm(formula=mod$IQ ~ mod$D1 + mod$D2)
summary(model0)
confint(model0)

model0a<-aov(mod$IQ~mod$condition)
summary(model0a)
TukeyHSD(model0a)

model1<-lm(mod$IQ ~ mod$WM + mod$D1 + mod$D2)
summary(model1)
confint(model1)
ggplot(mod,aes(x=WM,y=IQ)) +geom_smooth(method="lm") + geom_point()

#moderator
mod$WM.D1 = mod$WM*mod$D1 
mod$WM.D2 = mod$WM*mod$D2

model2<-lm(mod$IQ ~ mod$WM + mod$D1 + mod$D2 + mod$WM.D1 + mod$WM.D2)
summary(model2)
confint(model2)
anova(model1,model2) # para ver se a mudança no R^2 é siginicante
ggplot(mod,aes(x=WM,y=IQ)) +geom_smooth(method="lm") + geom_point()

#mediation
med<-read.table("data2.txt",header=T)
View(med)
describeBy(med,med$condition)
model.YX<-lm(med$IQ~med$condition)
model.YXM<-lm(med$IQ~med$condition + med$WM)
model.MX<-lm(med$WM~med$condition)

model.ALL<-sobel(med$condition,med$WM,med$IQ)
model.ALL
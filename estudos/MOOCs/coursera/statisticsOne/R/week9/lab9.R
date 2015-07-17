#between groups factorial analysis
library(psych)
library(car)
library(lsr)
library(ggplot2)
library(reshape)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week9")
AB<-read.table("lab9.txt",header=T)

#Independent variable: conversation and driving
leveneTest(AB$errors ~ AB$driving * AB$conversation)# ha homogenidade entre os 6 grupos

#factorial anova, o que nos da: main effect of driving difficult,
# main effect of conversation difficult and  the interecation 
AB.model<-aov(AB$errors ~ AB$driving * AB$conversation)
#  conversation and driving são ortogonais
summary(AB.model)

#vimos que temos a good interecation, mas de onde ela vem?
#simple effect analysis (da convesation em cada nível de dificuldade)
AB1<-subset(AB,AB$driving=="Easy")
AB2<-subset(AB,AB$driving=="Difficult")

#one-way anova
aov.AB1<-aov(AB1$errors~AB1$conversation)
summary(aov.AB1)

aov.AB2<-aov(AB2$errors~AB2$conversation)
summary(aov.AB2)

#Both simple effects are significant, so why is there an interaction? Let's look at effect size
# podemos ver agora que o efeito no driving difficult é mais forte 
etaSquared(aov.AB1,anova=T) # explica 15% da variancia easy
etaSquared(aov.AB2,anova=T)

#pairwise comparasion for simple effects
TukeyHSD(aov.AB1)
TukeyHSD(aov.AB2)
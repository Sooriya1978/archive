library(psych)
library(car)
library(lsr)
library(ggplot2)
library(reshape)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week8")
data<-read.table("assignment8.txt",header=T)

#Q1) Using a dependent t-test, is the difference between pre and post-test scores significant?SIm
# neste caso os o mesmo grupo foi analisado duas vezes, antes e depois, então é "paired", dependente t-test
data.pre = subset(data,data$time=="pre")
data.post = subset(data,data$time=="post")
t.test(data$SR ~ data$time, paired=T)

#Q2) Create subsets for each training condition. Which group shows no difference between pre and post-test scores?
#conditions: WM, PE , DS
#dependente t-test
data.WM<-subset(data,data$condition=="WM")
data.PE<-subset(data,data$condition=="PE")
data.DS<-subset(data,data$condition=="DS")

t.test(data.WM[data.WM$time=="post",]$SR,data.WM[data.WM$time=="pre",]$SR,paired=T)
t.test(data.PE[data.PE$time=="post",]$SR,data.PE[data.PE$time=="pre",]$SR,paired=T)# não é significante
t.test(data.DS[data.DS$time=="post",]$SR,data.DS[data.DS$time=="pre",]$SR,paired=T)

#Q3) Which training group shows the largest effect size for the difference pre-test to post-test?
cohensD(data.WM[data.WM$time=="post",]$SR, data.WM[data.WM$time=="pre",]$SR, method="paired")
cohensD(data.PE[data.PE$time=="post",]$SR, data.PE[data.PE$time=="pre",]$SR, method="paired")
cohensD(data.DS[data.DS$time=="post",]$SR, data.DS[data.DS$time=="pre",]$SR, method="paired")

#Q4) Reshape the data into a wide format, and create a new variable for gain score. Now subset the new 
#dataframe based on the training conditions. Which comparison between training conditions 
#does not show a significant difference?
#independent t-test
reshaped<-cbind(subject=data.pre$subject)
reshaped<-as.data.frame(reshaped)
reshaped<-cbind(reshaped,condition=data.pre$condition)
reshaped<-cbind(reshaped,pre=data.pre$SR)
reshaped<-cbind(reshaped,post=data.post$SR)
gain=data.post$SR-data.pre$SR
reshaped<-cbind(reshaped,gain=gain)

reshaped.WM<-subset(reshaped,reshaped$condition=="WM")
reshaped.PE<-subset(reshaped,reshaped$condition=="PE")
reshaped.DS<-subset(reshaped,reshaped$condition=="DS")

#como são grupos diferentes, usar independent t-test
# mas antes testar a homogeinidade da variancia
leveneTest(reshaped$gain,reshaped$condition,center="mean")#ok, há homogeinidade

t.test(reshaped.WM$gain,reshaped.PE$gain,var.equal=T)
t.test(reshaped.WM$gain,reshaped.DS$gain, var.equal=T)
t.test(reshaped.PE$gain,reshaped.DS$gain,var.equal=T)
#todas diferenças são significantes

#Subset do professor:
library(reshape) 
data.wide = cast(data, subject+condition~time) 
data.wide$gain = data.wide$post - data.wide$pre 

#Q5) To compare the gain scores across all groups, we now turn to ANOVA. 
#Is the homogeneity of variance assumption violated?

leveneTest(reshaped$gain,reshaped$condition,center="mean")#ok, há homogeinidade

#Q6 Run an ANOVA model on the gain scores as a function 
#of training condition. Is the effect of condition significant? YES
aov.model = aov(reshaped$gain ~ reshaped$condition)
summary(aov.model)

#Q7 What is the corresponding eta-squared value? (round to 2 decimal places)
etaSquared(aov.model, anova=T)#0.34

#Q8) Are the eta-squared and partial eta-squared value different in this case?
#Não

#Q9) Let's now run post-hoc comparisons (Tukey HSD). Which two groups do not significantly
#differ from one another when considering gain scores?
TukeyHSD(aov.model) #WM-DS

#Q10) Based on these data, which training condition should you choose to target some improvements in spatial reasoning?
#WS-DS pois é o que apresenta problema 


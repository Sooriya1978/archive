setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week5")
library(psych)
library(ggplot2)
data<-read.table("assignment.txt",header=T)
View(data)

model1<-lm(data$salary~data$years)
summary(model1)
confint(model1)

model2<-lm(data$salary~data$courses)
summary(model2)
confint(model2)

model3<-lm(data$salary ~ data$years + data$courses)
summary(model3)
confint(model3)

anova(model1,model3)
anova(model2,model3)

model4<-lm(scale(data$salary) ~ scale(data$years) + scale(data$courses))
summary(model4)
confint(model4)

set.seed(1)
x=sample(nrow(data),15)
data.15<-data[x,]
round(cor(data),3)
round(cor(data.15),3)

data.subset<-data[51:70,]
new<-data.subset
model<-lm(new$salary~new$courses+new$years)
summary(model)

model1.subset = lm(data.subset$salary ~ data.subset$years)
model2.subset = lm(data.subset$salary ~ data.subset$courses)
model3.subset = lm(data.subset$salary ~ data.subset$years + data.subset$courses) 
anova(model1.subset,model3.subset)
anova(model2.subset,model3.subset)

data.subset$predict<-fitted(model3.subset)
data.subset$resid<-resid(model3.subset)
cor(data.subset)
cor.test(data.subset$predict,data.subset$resid)
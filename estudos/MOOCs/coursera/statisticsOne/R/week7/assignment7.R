library(psych)
library(ggplot2)
library(multilevel)
urlData="https://d396qusza40orc.cloudfront.net/stats1%2Fdatafiles%2FStats1.13.HW.07.txt"
download.file(urlData,destfile="./assignment.txt",method="curl")
data<-read.table("./assignment.txt",header=T)
View(data)
cor(data)

#What percentage of variance in happiness is explained by extraversion?
model1<-lm(data$happy~data$extra)
summary(model1)
confint(model1)

#What percentage of variance in happiness is explained by a model with both 
#extraversion and diversity of life experience as predictors?
model2<-lm(data$happy~data$extra+data$diverse)
summary(model2)
confint(model2)

#What is the unstandardized regression estimate of the indirect effect? 0.28
model<-sobel(data$extra, data$diverse, data$happy) 
model

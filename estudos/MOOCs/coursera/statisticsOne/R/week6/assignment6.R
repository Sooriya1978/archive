setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week6")
library(psych)
library(ggplot2)

data<-read.table("assignment6.txt",header=T)

#Q1: In a model predicting salary, what is the unstandardized regression coefficient for years, 
#assuming years is the only predictor variable in the model?
model1<-lm(data$salary~data$years)
summary(model1)

#Q2: In a model predicting salary, what is the 95% confidence interval for the unstandardized 
#regression coefficient for years, assuming years is the only predictor variable in the model? 
confint(model1)

#Q3: In a model predicting salary, what is the unstandardized regression coefficient for years,
#assuming years and courses are both included as predictor variables in the model? 
model2<-lm(data$salary~data$years+data$courses)
summary(model2)
confint(model2)

#Q4: What is the predicted difference in salary between Doctors and Lawyers assuming 
#an equal and average number of years and courses?
unique(data$profession) # Doctor será a referência
profession.code<-C(data$profession,treatment)
model3<-lm(data$salary~data$years+data$courses+(profession.code))
summary(model3)
#Q9)What is the actual difference in mean salary between Doctors and Teachers? 
tapply(data$salary,data$profession,mean)[1]-tapply(data$salary,data$profession,mean)[3]

#What combination of predictors represents the best model in terms of predicting salary? 
model4<-lm(data$salary~data$courses)
anova(model1,model2)
anova(model1,model3)
anova(model4,model2)
anova(model4,model3)
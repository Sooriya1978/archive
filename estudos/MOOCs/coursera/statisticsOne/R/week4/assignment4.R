#outcome variable: salary
#two predictors: years of experience and courses completed. 
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week4")
library(psych)
data<-read.table("assignment4.txt",header=T)

#Q1) What is the correlation between salary and years of professional experience?
round(cor(data[,2:4]),2)

#Q2) What is the correlation between salary and courses completed?
round(cor(data[,2:4]),2)

#Q3) What is the percentage of variance explained in a regression model with salary 
#as the outcome variable and professional experience as the predictor variable?
model3<-lm(data$salary ~ data$years)
summary(model3)

#Q4) Compared to the model from Question 3, would a regression model predicting salary 
#from the number of courses be considered a better fit to the data?
model4<-lm(data$salary ~ data$courses)
summary(model4) #No

#Q5) Now let's include both predictors (years of professional experience and courses completed)
#in a regression model with salary as the outcome. Now what is the percentage of variance explained?
model5 <- lm(data$salary ~ data$years + data$courses )
summary(model5)

#Q6) What is the standardized regression coefficient for years of professional experience, predicting salary?
model6<-lm(scale(data$salary)~scale(data$years))
summary(model6)
#ou
round(cor(data[,2:4]),2)

#Q7) What is the standardized regression coefficient for courses completed, predicting salary?
model7<-lm(scale(data$salary)~scale(data$courses))
summary(model7)
round(cor(data[,2:4]),2)

#Q8) What is the mean of the salary distribution predicted by the model including both years of professional 
#experience and courses completed as predictors? (with 0 decimal places)
model8<- lm(data$salary ~ data$years + data$courses )
data$predicted<-fitted(model8)
summary(data$predicted,digits=7)

#Q9)What is the mean of the residual distribution for the model predicting salary from both years of professional 
#experience and courses completed? (with 0 decimal places)
model9<- lm(data$salary ~ data$years + data$courses )
data$erro <- resid(model9)
summary(data$erro,digits=8)
hist(data$erro)




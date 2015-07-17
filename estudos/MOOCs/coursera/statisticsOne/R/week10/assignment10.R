library(psych)
library(aod)
library(QuantPsyc)
library(ggplot2)
library(reshape)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week10")
data<-read.table("assignment10.txt",header=T)
data$change <-as.factor(data$change)

# Q1) What is the median population age for the countries which voted to take action against global warming? 
describeBy(data$age, data$change=="1")

#Q2) Run a logistic regression including all predictor variables. Which predictors are significant in this model?
model<-glm(data$change ~ data$age + data$educ + data$gdp + data$co2,family=binomial)
summary(model)

#Q3 What does the negative value for the estimate of educ means?

Countries with a lower education index score are more likely to chose to act now
Countries with a higher education index score are more likely to chose to wait and see
Educ and change are negatively correlated 

# Q4 What is the confidence interval for educ, using profiled log-likelihood? (round to 2 decimal places,
# and give the lower bound first and the upper bound second, separated by a space)
confint(model)

# Q5 What is the confidence interval for age, using standard errors? (round to 2 decimal places, 
# and give the lower bound first and the upper bound second, separated by a space)
confint.default(model)

# Q6 Compare the present model with a null model. What is the difference in deviance 
#for the two models? (round to 2 decimal places)
with(model,null.deviance - deviance)

#Q7  How many degrees of freedom are there for the difference between the two models?
with(model,df.null - df.residual)

#Q8 Is the p-value for the difference between the two models significant?
with(model,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail=FALSE))
#YES

#Q9 Do chi-squared values differ significantly if you drop educ as a predictor in the model?
coef(model)
wald.test(b=coef(model),Sigma=vcov(model),Terms=2) #age
wald.test(b=coef(model),Sigma=vcov(model),Terms=3) #educ
wald.test(b=coef(model),Sigma=vcov(model),Terms=4) #gdp
wald.test(b=coef(model),Sigma=vcov(model),Terms=5) #co2


#Q10 What is the percentage of cases that can be classified correctly based on our model?
ClassLog(model,data$change)
#81.48%










# This week, we turn to a classic study on helping behavior by Darley and Batson (1973). 
# Simulated data are provided here. The study demonstrates that people’s likelihood of 
# helping a person in distress depends largely on their level of haste—whether they were 
# running early, on time, or late for an appointment—when they encounter him, rather than 
# on whether they have been asked to reflect on a pro-helping message 
# (the parable of the Good Samaritan) as opposed to a neutral message (occupational effectiveness). 
# In this dataset, independent variables include Prime 
# (1 = parable of the Good Samaritan; 2 = occupational effectiveness) and Haste 
# (1 = early, 2 = on time, 3 = late). On their way to a nearby location, 
# participants encounter a moaning individual in distress. The Helping variable provides a 
# measure of how much they help, ranging from 0 to 6 with higher scores indicating greater helping. 

library(psych)
library(car)
library(lsr)
library(ggplot2)
library(reshape)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week9")
data<-read.table("assignment9.txt",header=T)
View(data)

# Q1) What is the class of Haste and Prime in R?
class(data$Haste)
class(data$Prime)

# Q2)After converting Haste and Prime to factors, run an ANOVA with both Haste and Prime 
# as independent variables. Is the effect of Haste significant?
data$Haste<-as.factor(data$Haste)
data$Prime<-as.factor(data$Prime)
model.aov<-aov(data$Helping~data$Prime*data$Haste)
summary(model.aov)

# Q3) Is the effect of Prime significant?
YES

# Q4) Is the interaction significant?
YES

# Q5)  Save the ANOVA summary in a table and run Tukey's 
# pairwise comparison on all group means. Do each level of Haste significantly differ from one another?
TukeyHSD(model.aov)

# Q6) What is the partial eta-squared value for the effect of Haste? (round to 2 decimal places).
etaSquared(model.aov,anova=T)#0.38

# Q7) What is the partial eta-squared value for the interaction? (round to 2 decimal places).
0.18

# Q8) Let's now run simple effects of Prime at each level of Haste. At which level of Haste
# is the effect of Prime significant?

A1.B = subset(data, data$Haste == "1") 
A2.B = subset(data, data$Haste == "2") 
A3.B = subset(data, data$Haste == "3") 
aov.A1.B = aov(A1.B$Helping ~ A1.B$Prime) 
summary(aov.A1.B) 
aov.A2.B = aov(A2.B$Helping ~ A2.B$Prime) 
summary(aov.A2.B) 
aov.A3.B = aov(A3.B$Helping ~ A3.B$Prime) 
summary(aov.A3.B)
#Early

# Q9 What is the partial eta-squared value for the effect of Prime when people were early? (round to 2 decimal places).
etaSquared(aov.A1.B)

# Q10) Which one of the following statements best illustrates the main finding of the study?
#resposta: People are more likely to help others after being primed to do so if they are early





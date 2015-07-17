library(psych)
library(aod)
library(QuantPsyc)
library(ggplot2)
library(reshape)
library(lsr)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week11")
data<-read.table("assignment11.txt",header=T)
View(data)

# Recent theories in the field of cognitive enhancement suggest that people's belief about whether 
# or not cognitive abilities can be improved influences the outcome of a training program. 
# In this week's assignment, we take a look at a dataset including two different kinds of 
# feedback given to participants in a cognitive training program, either fixed (cognitive 
# abilities are innate and cannot be improved) or malleable (cognitive abilities are largely 
# driven by experiences). DVs include verbal, spatial, and intelligence measures,provided before and after training. 

#Q1) Using a t-test, compare verbal scores before and after training in the fixed condition. 
# Is the difference pre-test to post-test significant?
fixed = subset(data,data$cond =="fixed")
t.test(fixed$verbal.pre,fixed$verbal.post,paired=T)

#Q2)What are the degrees of freedom for the comparison between pre-test and post-test for the spatial scores?
t.test(fixed$spatial.pre,fixed$spatial.post,paired=T)

#Q3 Run a Wilcoxon test for the same comparison (pre-test to post-test on spatial scores, fixed condition).
# Which of the two tests gives the highest p-value for the comparison?
wilcox.test(fixed$spatial.pre, fixed$spatial.post,paired=T)

#Q4 What is the effect size (Cohen's d) for the difference between pre-test and post-test spatial scores
#for the malleable condition? (round to two decimal places)
malleable = subset(data,data$cond=="malleable")
cohensD(malleable$spatial.pre,malleable$spatial.post,method="paired")

#Q5 Which of the three tasks shows the largest improvements from pre-test to post-test, in the fixed condition?
cohensD(fixed$verbal.pre, fixed$verbal.post, method="paired") #Verbal
cohensD(fixed$spatial.pre, fixed$spatial.post, method="paired") 
cohensD(fixed$intel.pre, fixed$intel.post, method="paired")

#Q6 Which of the three tasks shows the largest improvements from pre-test to post-test, in the malleable condition?
data.m<-malleable
cohensD(data.m$verbal.pre, data.m$verbal.post, method="paired") #verbal
cohensD(data.m$spatial.pre, data.m$spatial.post, method="paired") 
cohensD(data.m$intel.pre, data.m$intel.post, method="paired")

#Q7 Conduct Mann-Whitney comparisons between all tasks at pre-test. 
# Which task(s) differ significantly from the other two in pre-test scores?
wilcox.test(data$verbal.pre,data$spatial.pre,paired=FALSE)
wilcox.test(data$verbal.pre,data$intel.pre,paired=FALSE)
wilcox.test(data$spatial.pre,data$intel.pre,paired=FALSE)
#all


#Q8 Which feedback condition led to the largest improvements overall?
data.f<-fixed
pre.m = data.m$verbal.pre + data.m$spatial.pre + data.m$intel.pre 
post.m = data.m$verbal.post + data.m$spatial.post + data.m$intel.post 
cohensD(pre.m, post.m, method="paired") 
pre.f = data.f$verbal.pre + data.f$spatial.pre + data.f$intel.pre 
post.f = data.f$verbal.post + data.f$spatial.post + data.f$intel.post 
cohensD(pre.f, post.f, method="paired")

#Q9 Which task is largely driving this effect?

cohensD(data.m$verbal.pre, data.m$verbal.post, method="paired") 
cohensD(data.m$spatial.pre, data.m$spatial.post, method="paired") 
cohensD(data.m$intel.pre, data.m$intel.post, method="paired") 
cohensD(data.f$verbal.pre, data.f$verbal.post, method="paired") 
cohensD(data.f$spatial.pre, data.f$spatial.post, method="paired") 
cohensD(data.f$intel.pre, data.f$intel.post, method="paired")

#Q10 Based on the present data, are you convinced that malleable feedback is beneficial to performance when engaging in a cognitive training program?
#sim
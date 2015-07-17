library(psych)
library(car)
library(lsr)
library(ggplot2)
library(reshape)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week8")
data<-read.table("lab8.txt",header=T)

View(data)
describeBy(data,data$cond)

#Vamos fazer 3 coisas neste exercícios:
#1)Dependent t-test
#2)Independent t-test
#3)one way between measures ANOVA


#Dependent t-test
data.control = subset(data,data$train=="0")
data.train = subset(data,data$train=="1")

t.test(data.control$post,data.control$pre, paired=T)

t.test(data.train$post,data.train$pre, paired=T)

#Como o train e control tem N diferentes vamos
#Rodar um cohen test para verificar o effect size
# d = mean of diffence score / sd of difference score
data.control.out = describe(data.control)
data.train.out = describe(data.train)
data.control.out
d.control = data.control.out[4,3]/data.control.out[4,4]
d.control
d.train = data.train.out[4,3]/data.train.out[4,4]
d.train
# ou a mesma coisa
cohensD(data.control$post,data.control$pre,method="paired") # quanto mario, maior o efeito
cohensD(data.train$post,data.train$pre,method="paired") # quanto mario, maior o efeito

#graficos
long <- melt(data,id=c("cond","train","gain"))
long
ggplot(long,aes(x=cond,y=value,color=variable)) +
  geom_boxplot()+ guides(fill=F)

#indepedent t-test
t.test(data$gain ~ data$train, var.equal=T)

#cohen d = (M1-M2)/pooled standart deviation
data.control.out
degree_freedom_c =  data.control.out[1,2] - 1
degree_freedom_t =  data.train.out[1,2]  - 1
df.total = degree_freedom_c + degree_freedom_t

pooled.sd=( (degree_freedom_t/df.total)*data.train.out[4,4] +
              (degree_freedom_c/df.total)*data.control.out[4,4]  )
d = (data.train.out[4,3]- data.control.out[4,3])/pooled.sd
d
cohensD(data$gain ~ data$train,method="pooled")

#grafico 
ggplot(data,aes(x=cond,y=gain,fill=cond)) + geom_boxplot() + guides(fill=FALSE)

###########
#One-way between groups analysis of variance

#homogeinidade da variancia entre os grupos
#não é significante, então não uma diferencea significante da variancia entre os grupos
leveneTest(data.train$gain,data.train$cond,center="mean")

model <-aov(data.train$gain ~ data.train$cond)
out<-summary(model)

#effect Size eta, proporção da variancia explicada no gain devido ao train manipulation
ss=out[[1]]$"Sum Sq"
eta.sq = ss[1]/(ss[1]+ss[2])
eta.sq
etaSquared(model,anova=T)

TukeyHSD(model)
  
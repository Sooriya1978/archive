#week 6
# Nesta semana faremos regressão linear incluindo  uma predict variable categorical.
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week6")
library(psych)
library(ggplot2)

#Salario: Outcome variable, as outras são predicts
# departament: Psychology,History, Sociology

data<-read.table("labdata6.txt",header=T)
describe(data)

round(cor(data[1:4]),3)

# vamos mostrar que age e years são redundante
#Lição: Nós não temos que necessariamente incluir na regressão múltipla
# todas os predictor que temos a disposição
model0<-lm(formula=data$salary ~ data$age + data$years)
summary(model0)

model1<-lm(formula=data$salary ~  data$years)
summary(model1)
confint(model1)

model2<-lm(formula=data$salary ~  data$pubs)
summary(model2)
confint(model2)

model3<-lm(formula=data$salary ~  data$pubs + data$year)
summary(model3)
confint(model3)

#comparar modelos
anova(model1,model3)#mostra que o model3 é estatisticamente significante melhor que o model1
anova(model2,model3)

#Agora vamos incluir categorical predictor na análise
departamento.code<-C(data$dept,treatment) # O codigo com a primeira letra do alfabeto será referencia
(departamento.code)

model4<-lm(data$salary ~ data$pubs + data$year + (departamento.code))
#P e S são com relação a referencia
summary(model4)
confint(model4)

anova(model3,model4)

tapply(data$salary,data$dept,mean)
tapply(data$years,data$dept,mean)
tapply(data$pubs,data$dept,mean)
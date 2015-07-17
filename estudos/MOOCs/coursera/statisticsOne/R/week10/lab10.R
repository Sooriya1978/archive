library(psych)
library(aod)
library(QuantPsyc)
library(ggplot2)
library(reshape)
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week10")
data<-read.table("lab10.txt",header=T)

describe(data)

#binary logistc regression
model<-glm(data$verdict ~ data$danger + data$rehab + data$punish + data$gendet + data$specdet + data$incap,family=binomial)
summary(model)
# lembrar que esses coeficiente é os logit (ou seja, o ln dos odds)

confint(model)
confint.default(model)

#avaliar o modelo, comparar o qui quadrado com o qui quadrado de um modelo null (com nenhum predicotr)
with(model,null.deviance - deviance)
with(model,df.null - df.residual)
with(model,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail=FALSE))#p-value, assim esse modelo é mais siginificante que o null model.

#wald teste para cada coeficiente (o quanto do qui-quadrado mudaria do modelo se vc removesse o coeficiente em questão)
wald.test(b=coef(model),Sigma=vcov(model),Terms=2) #danger
wald.test(b=coef(model),Sigma=vcov(model),Terms=3) #rehab
wald.test(b=coef(model),Sigma=vcov(model),Terms=4) #..
wald.test(b=coef(model),Sigma=vcov(model),Terms=5) #..
wald.test(b=coef(model),Sigma=vcov(model),Terms=6) #..
wald.test(b=coef(model),Sigma=vcov(model),Terms=7) #..


#Odds ratio
coef(model)
exp(coef(model))
# 1 siginifica que o predictor não preve nada, menor que 1 significa que é inversamente proporcional, e maior que é um forte predictor. 

ClassLog(model,data$verdict)
# com esse modelo estams classificando 71% dos casos corretamente.
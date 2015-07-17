#week 5
#Tasks:correlation,regression analyses: NHST, standart error, CI, model comparison

#Dados: Outcome Y (melhora fisica), predictors X: idade e tempo de treino
#N=200, mas vamos fazer grupos de 20
setwd("/home/thiago/Dropbox/estudos/ead/coursera/statisticsOne/R/week5")
library(psych)
library(ggplot2)
data<-read.table("data.txt",header=T)
describe(data)
#SE: sample error: o quanto de erro na amostragem esperamos
stat<-describe(data)
age.sd<-stat[2,4]
age.N<-stat[2,2]
age.SE<-age.sd/sqrt(age.N)

#Correlação
round(cor(data[2:4]),2)

#teste de significância para a correlação. NHST. Hipotese nula, correlação 0
cor.test(data$age,data$activeyears)
cor.test(data$endurance,data$activeyears)
cor.test(data$endurance,data$age) # Não é statisticamente significante, retain the null hipoteses

data.cor<-cor(data[2:4])

#análise de regressão 
model1<-lm(data$endurance~data$age)
summary(model1) # notar que o p-value/r é o mesmo que antes porque estamos fazendo uma correlação simples

#Calculo do coeficiente de correlação B = r * (sdy/sdx), onde r é o coeficiente da correlação
model1.B<- data.cor[1,3]* (stat[4,4]/stat[2,4])

#Standart Error of a regression coefficient
#SE = raiz [ (soma dos quadrados dos residuos/ (N-2)  ) / soma dos quadrados dos X]
#anova nos da a soma dos residuos quadrados
# n-2 são os graus de liberdade
model1.anova<-anova(model1)
SS.resid<-model1.anova[2,2]
grau<-model1.anova[2,1]
model1.anova
#soma dos squares de X é a soma do model + soma dos residuo
SS.X<-model1.anova[1,2] + model1.anova[2,2]
SE.B<-sqrt( (SS.resid/grau) / SS.X)
summary(model1)

#CI
confint(model1)

#CI: B +/- (t-critico*SE.B)
t <- qt(c(.025,0.975),df=198)
interval<-model1.B + (t*SE.B)

#plotar o intervalo de confianca na linha de regressão
# pois a coefiente da regressão é apenas um ponto estimado
ggplot(data,aes(x=age,y=endurance))+ geom_smooth(method="lm") + geom_point()

#refazendo com dois predictors
model2<-lm(data$endurance ~ data$activeyears)
summary(model2)
# A "nova variavel predict que representa as outras duas"
ggplot(data,aes(x=activeyears,y=endurance))+ geom_smooth(method="lm") + geom_point()

#refazendo com dois predictors
model3<-lm(data$endurance ~ data$age + data$activeyears)
summary(model3)
# A "nova variavel predict que representa as outras duas"
data$predic<-fitted(model3)
ggplot(data,aes(x=predic,y=endurance))+ geom_smooth(method="lm") + geom_point()

#Qual modelo é melhor o 2 ou 3?
# O 3 é signiicantemente melhor que o 2?
# null hipoteses neste caso: model2 e model3 são equivalentes em termos de explicar o outcome X
anova(model2,model3)
# como o p-value é 0.002247 e portanto menor que 0.05, a dif entre 2 e 3 é estatisticamente significante e rejeitamos a
# hipotese nula

#Z score
model1.z <- lm(scale(PE$endurance) ~ scale(PE$age))
summary(model1.z) # notar que a interceptação é praticamente zero
confint(model1.z)

model2.z <- lm(scale(PE$endurance) ~ scale(PE$activeyears))
summary(model2.z)
confint(model2.z)

model3.z <- lm(scale(PE$endurance) ~ scale(PE$age) + scale(PE$activeyears))
summary(model3.z)
confint(model3.z)

# Conduct a model comparison NHST to compare the fit of model2.z to the fit of model3.z
anova(model2.z, model3.z)
# Note that the F value and the p value are the same as from the unstandardized model comparison
anova(model2, model3)

# vamos reduzir N
x=sample(nrow(data),20)
data.20<-data[x,]
describe(data.20)


getwd()
setwd("~/Dropbox/estudos/ead/coursera/stastaticsOne/R/week3")
library(psych)
library(gclus)
library(rgl)

data<-read.table("data3.txt",header=T)
View(data)

# Designed sport training (des) and Aerobic training (aer). 
# We measured both verbal and spatial reasoning before and after training, 
#using four separate measures: • S1 • S2 • V1 • V2. 

#Q1) What is the correlation between S1 and S2 pre-training?
cor(data$S1.pre,data$S2.pre)

#Q2) What is the correlation between V1 and V2 pre-training?
cor(data$V1.pre,data$V2.pre)

#Q3) With respect to the measurement of two distinct constructs, 
# spatial reasoning (S) and verbal reasoning (V), 
#the pattern of correlations pre-training reveals:

#Convergent validity
# Para satisfazer a validade de convergência os resultados
# de diferentes testes devem estar correlacionado (sendo 1 dele o modelo aceito)

#Divergent validity 
#mostrar que o teste não correlaciona com teste que 
# quantificam outras capacidade além da considerada. 

#Resposta: Antes e depois o teste realizado 2 vezes. 
# Validade de divergência, pois os dados são de objetos diferente(S e V)
# e não correlacionam

#validade de convergiencia (ex 1 e 2 )
data$S.pre = (data$S1.pre + data$S2.pre) / 2
data$V.pre = (data$V1.pre + data$V2.pre) / 2 
cor(data$S.pre, data$V.pre) 

#Q4) Correlations from the control group could be used to 
#estimate test/retest reliability. If so, which test is most reliable?
#grupo de controle é aer 
#Deve haver correlação (test/retest) nas 4 medidas

#professor
data.aer = subset(data, data$cond=="aer") 
cor(data.aer$S1.pre, data.aer$S1.post)
cor(data.aer$S2.pre, data.aer$S2.post)
cor(data.aer$V1.pre, data.aer$V1.post)
cor(data.aer$V2.pre, data.aer$V2.post)


#Q5) Does there appear to be a correlation between spatial 
#reasoning before training and the amount of improvement in spatial reasoning?

#Professor
data$S.pre = (data$S1.pre + data$S2.pre) / 2 
data$V.pre = (data$V1.pre + data$V2.pre) / 2 
data$S.post = (data$S1.post + data$S2.post) / 2
data$V.post = (data$V1.post + data$V2.post) / 2 
data$Sgain = data$S.post - data$S.pre
data$Vgain = data$V.post - data$V.pre
cor(data$S.pre, data$Sgain)


#Q6) Does there appear to be a correlation between verbal reasoning before training 
# and the amount of improvement in verbal reasoning?

#professor
cor(data$V.pre, data$Vgain)

#Q7) Which group exhibited more improvement in spatial reasoning?

#Professor
describeBy(data$Sgain, data$cond) #olhar a média

#Q8) Create a color scatterplot matrix for all 4 measures at pre-test. Do the scatterplots
# suggest two reliable and valid constructs?

#professor
pre.r = abs(cor(pre = cbind(data[3], data[4], data[7], data[8]))) 
cpairs(pre, order.single(pre.r), panel.colors = dmat.color(pre.r), gap=.5)

colunas.pre = cbind(data$S1.pre ,
       data$S2.pre,
       data$V1.pre,
       data$V2.pre)
r <- abs(cor(colunas.pre))
cpairs(colunas.pre,order.single(r),panel.colors = dmat.color(r),gap = 0.5)

pairs(~data$S1.pre +
      data$S2.pre + 
      data$V1.pre +
      data$V2.pre,
      cex.labels = 1.2 
)

#reliable: 
#valid constructs

#Q9) Create a color scatterplot matrix for all 4 measures at post-test. Do the scatterplots
# suggest two reliable and valid constructs?

#professor
colunas.post = cbind(data[5], data[6], data[9], data[10])
post.r = abs(cor(colunas.post)) 
cpairs(colunas.post, order.single(post.r), panel.colors = dmat.color(post.r), gap=.5)

#reliable: 
#valid constructs

#Q10) What is the major change from pre-test to post-test visible on the color matrix?


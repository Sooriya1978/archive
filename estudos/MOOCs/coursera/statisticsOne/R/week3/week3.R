# Example
#   Investigating the effects of sports-related concussion
#   Simulated data are based on an online assessment tool called IMPACT (http://www.impacttest.com)
#   IMPACT provides 6 main measures, listed here:
#     Memory composite verbal (vermem)
#     Memory composite visual (vismem)
#     Visual motor speed composite (vms)
#     Reaction time composite (rt)
#     Impulse control composite (ic)
#     Total symptom score (sym)

getwd()
setwd("~/Dropbox/estudos/ead/coursera/stastaticsOne/R/week3")
library(psych)
library(gclus)
library(rgl)

impact<-read.table("Lab3.txt",header=T)
View(impact)
names(impact)

describe(impact)
describeBy(impact,impact$condition)

#BaseLine
cor(impact[3:8])
round(cor(impact[3:8]),2)
View(round(cor(impact[3:8]),2))
# verbal and visual memory estão correlacionados o que indica: 
# reliability: Se não tivesse reability seria correlacinado com qualquer coisa.
# valid: Porque converge com outra medida de memoria

ncol(impact)
#Retest
cor(impact[9:14])
round(cor(impact[9:14]),2)
View(round(cor(impact[9:14]),2))
# se olharmos a correlação entre a medida 1 e 2 temos reliability

control <- subset(impact,impact[,2]=="control")
concussed <- subset(impact,impact[,2]=="concussed")

View(round(cor(control[3:14]),2))
#Ver que o Reaction Time não e confiável

View(round(cor(concussed[3:14]),2))
# No concussed grupo não podemos pensar no test/retest de confiança, porque they are concussed in between

# a memória no grupo de controle se enfraquece depois da concussão?
# jogadores mais impulsivos, jogam mais agressivamente e estão mais suscetivel a concussões, o que piora/enfraquece a memória.

concussed$visual.impair <- concussed$visual_memory_baseline - concussed$visual_memory_retest
concussed$verbal.impair <- concussed$verbal_memory_baseline - concussed$verbal_memory_retest
concussed$memory.impair <- (concussed$verbal.impair - concussed$visual.impair)/2

#mostra que pessoal impulsivas tem o enfraquecimento da memória
cor(concussed$memory.impair,concussed$impulse_control_baseline)

plot(impact$verbal_memory_baseline ~ impact$visual_memory_baseline )
abline(lm(impact$verbal_memory_baseline ~ impact$visual_memory_baseline),col="blue")
 
pairs(~impact$verbal_memory_baseline +
       impact$visual_memory_baseline +
       impact$visual.motor_speed_baseline +
       impact$reaction_time_baseline + 
       impact$total_symptom_baseline,
       cex.labels = 1.2 
        )

base <- impact[,3:8]
r <- abs(cor(base))
base.color<-dmat.color(r)
base.order<-order.single(r)
cpairs(base,base.order,base.color,gap=0.5,main="Ordenada e colorida pela correlação")

plot3d(impact$visual_memory_baseline,
       impact$verbal_memory_baseline,
       impact$total_symptom_baseline
       )


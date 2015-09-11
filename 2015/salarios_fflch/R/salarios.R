#setwd('~/remota/repos/git.uspdigital.usp.br/archive/2015/salarios_fflch/')
setwd("~/Desktop/repos/archive/2015/salarios_fflch/")

options(encoding = 'utf-8')
data = read.csv('input/tratados/2015/maio.csv',header=T,dec=',')

data[data==''] = NA

salarios_fflch = subset(data,data$unidade == 'FFLCH')

funcionarios_ativos = subset(salarios_fflch, 
                             salarios_fflch$Categoria == 'Celetista' | 
                             salarios_fflch$Categoria == 'Func Aut')


library(dplyr)
setores <- group_by(funcionarios_ativos, setor)
#summarise(setores, mean=mean(salario),sd=sd(salario) )
pdf('output/test.pdf')
boxplot(funcionarios_ativos$setor ~ fun
        cionarios_ativos$salario)
dev.off()
means = summarise(setores, mean=mean(salario) )
myorder <- means$group[order(means$mean)]
library(ggplot2)
p = ggplot(funcionarios_ativos, aes(setor, salario,color=setor,fill=setor))+
  geom_boxplot(outlier.colour="red",
               dotsize=1) +
  #you just need to use scale_x_discrete with the limits argument
  #to pass in details of the order of appearance for the boxplots
  #in this case the order is the myorders vector
  scale_x_discrete(limits=myorder)

p + theme(legend.position="bottom")

# Chefes
chefes=subset(funcionarios_ativos,!is.na(funcionarios_ativos$Função.de.Estrutura))
write.csv(chefes,'output/chefes_fflch_maio.csv',row.names=F)

write.csv(funcionarios_ativos[,c('unidade','setor','salario')],'output/salarios_funcionarios_fflch.csv')


#Celetista  
#Doc Apos   
#Func Apos  
#Docente    
#Func Aut   
#Compl Apos
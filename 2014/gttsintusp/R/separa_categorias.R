setwd("~/Desktop/mygits/gttsintusp/")

salarios = read.csv("input/salarios-setembro2014-folha.csv",sep=";",dec=",",header=T)

docentes =  subset(salarios,salarios$Categoria=='Docente')
write.table(docentes,file="output/docentes.csv",sep=";",dec=",",row.names=F)

funcionarios = subset(salarios,salarios$Categoria=='Celetista' | salarios$Categoria=='Funcionário Autárquico/Estatutário') 
write.table(funcionarios,file="output/funcionarios.csv",sep=";",dec=",",row.names=F)

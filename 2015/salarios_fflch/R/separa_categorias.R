setwd("~/Desktop/repos/archive/2015/salarios_fflch/")

salarios = read.csv("input/",sep=";",dec=",",header=T)

docentes =  subset(salarios,salarios$Categoria=='Docente')
write.table(docentes,file="output/docentes.csv",sep=";",dec=",",row.names=F)

funcionarios = subset(salarios,salarios$Categoria=='Celetista' | salarios$Categoria=='Funcionário Autárquico/Estatutário') 
write.table(funcionarios,file="output/funcionarios.csv",sep=";",dec=",",row.names=F)

setwd('~/remota/repos/git.uspdigital.usp.br/archive/2015/salarios_fflch/')
options(encoding = 'utf-8')
maio = read.csv('input/tratados/2015/maio.csv',header=T)

salarios_fflch = subset(maio,maio$unidade == 'FFLCH')

funcionarios_ativos = subset(salarios_fflch, 
                             salarios_fflch$Categoria == 'Celetista' | 
                             salarios_fflch$Categoria == 'Func Aut')

write.csv(funcionarios_ativos[,c('unidade','setor','salario')],'output/salarios_fflch.csv')


#Celetista  
#Doc Apos   
#Func Apos  
#Docente    
#Func Aut   
#Compl Apos
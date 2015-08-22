setwd('~/remota/repos/own/usp/archive/2015/meteorologia_media_diaria')

# Lê dados do Luis
galeao = read.csv('data/Galeao_Python.csv')

# Converte coluna em datetime
galeao$DataHora = strptime(galeao$DataHora,format="%m/%d/%Y %H:%M:%S")

# Monta coluna de data com
inicio = as.POSIXct("2007-05-03 10:00:00") 
fim    = as.POSIXct("2008-12-08 23:00:00")

# Gera as sequência de datas horária
DataHora = seq(inicio, fim, by="hour")

# Converte DataHora para data.frame 
DataHoraCompleta = as.data.frame(DataHora)
colnames(DataHoraCompleta) = 'DataHoraCompleta'

# Verifica as horas faltantes
x = as.character(galeao$DataHora)
y = as.character(DataHoraCompleta$DataHoraCompleta)
horas_faltantes = as.data.frame(setdiff(y,x))
colnames(horas_faltantes) = 'DataHora'

# Converte galeo$DataHora para caracter
galeao$DataHora = as.character(galeao$DataHora)

# Junta tabelas
galeao_novo = merge(horas_faltantes,galeao,all=T,by="DataHora")

# Ordanando 
galeao_novo$DataHora = strptime(galeao_novo$DataHora,format="%Y-%m-%d %H:%M:%S")
galeao_novo = galeao_novo[order(galeao_novo$DataHora),]
write.csv(galeao_novo,file="galeao_novo.csv",row.names=F)

setwd('~/remota/repos/archive/2015/media_diaria/')

inicio = as.POSIXct("2006-12-31 21:00:00",tz = 'GMT') 
fim    = as.POSIXct("2007-01-02 23:00:00",tz = 'GMT')  # '31/12/2008 20:00:00'

# Uma tabela que começa em inicio e acaba em fim com intervalor de hora em hora.
# com as seguintes colunas:	TempAr

# Gera as sequência de datas horária
date_brazilian = seq(inicio, fim, by="hour")

# Transformar brazilian_dates em tabela 
mascara = as.data.frame(date_brazilian)

# Adiciona coluna TempAr
#mascara = cbind(mascara,TempAr=NA)

# Lê modelo do Luis
test = read.csv('test.csv')

# Converte data do Luis para padrão do R:
test$date_brazilian = strptime(test$date_brazilian,format="%d/%m/%Y %H:%M:%S",tz="GMT")
class(test$date_brazilian)

test$date_brazilian[1] ==
mascara$date_brazilian[1]

# Remove colunas indesejadas
test = test[,c(1,4)]

library(data.table)

dt1 <- data.table(mascara,  key = "date_brazilian") 
dt2 <- data.table(test, key = "date_brazilian")

joined.dt1.dt.2 <- dt1[dt2]

x = merge(mascara,test,by='date_brazilian',all=T)

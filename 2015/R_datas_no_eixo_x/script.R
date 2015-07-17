setwd('~/remota/repos/own/usp/archive/2015/R_datas_no_eixo_x/')
disease <- read.csv('disease.csv')
disease$data <- as.POSIXct(strptime(disease$data, format = '%Y-%m-%d', tz = 'GMT'))

disease[is.na(disease)] <- 0

plot(disease$DCV ~ disease$data,
     disease, 
     xaxt = "n", 
     type = 'l', 
     col = 'blue', 
     xlab = 'Ano', 
     ylab = 'Morbidade', 
     ylim = range(0, 208), 
     main = 'Hospitalições em Hospitais de SP')

# delimitar a dimensao do eixo x ("%b-%Y")
axis(1, disease$data, format(disease$data, "%b-%Y"))
legend(x='topleft', legend='DCV',  fill='blue')


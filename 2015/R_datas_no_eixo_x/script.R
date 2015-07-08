setwd('~/remota/repos/archive/2015/R_datas_no_eixo_x/')
disease <- read.csv('disease.csv')
disease$data <- as.POSIXct(strptime(disease$data, format = '%Y-%m-%d', tz = 'GMT'))
disease[is.na(disease)] <- 0

plot(disease$data,
     disease$DCV,
     type = 'h',
     col = 'blue',
     xlab = 'Ano',
     ylab = 'Morbidade',
     xaxt = "n",
     ylim = range(0, 208),
     main = 'Hospitalizações')
todas_datas = disease$data

dates <- seq(as.Date("01/01/2000", format = "%d/%m/%Y"),
             by = "years", length = 14)
dates
axis.Date(side = 1, dates, format = "%Y-%m-%d")

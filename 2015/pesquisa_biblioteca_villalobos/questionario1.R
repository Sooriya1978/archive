setwd('~/remota/repos/archive/2015/pesquisa_biblioteca_villalobos/')
source('enunciados_questionario1.R')
source('localfunctions.R')

weekend<-read.csv('data/weekend_inside_library.csv')
weekdays<-read.csv('data/weekdays_inside_library.csv')

for (i in questionario1)
{
  #i = questionario1[[3]]

  num = i[[1]]
  pergunta = i[[2]]
  options = i[[3]]
  print(options)

  options_values = cbind(letter = letters[1:length(options)],
                       description = options)

  x = computing_letters(weekdays[,num])
  y = computing_letters(weekend[,num])

  # Resolve problema de quando nenhuma das opções são escolhidas
  if(length(x) != length(options))
  {
    presentes = letters[1:length(options)] %in% colnames(x) 
    faltantes = letters[1:length(options)][!presentes]
    zeros = rep(0,length(faltantes))
    zeros=t(data.frame(zeros))
    colnames(zeros) = faltantes
    x = cbind(x,zeros)
  }
  if(length(y) != length(options))
  {
    presentes = letters[1:length(options)] %in% colnames(y) 
    faltantes = letters[1:length(options)][!presentes]
    zeros = rep(0,length(faltantes))
    zeros=t(data.frame(zeros))
    colnames(zeros) = faltantes
    y = cbind(y,zeros)
  }
  x = x[,options_values[,1]]
  y = y[,options_values[,1]]
  xy = rbind(x,y)
  rownames(xy) = c('Durante a semana','Final de semana')

  #rownames(xy) = c('Durante a semana','Final de semana')
  for(j in colnames(xy)){
    colnames(xy)[colnames(xy)==j] = options_values[options_values[,1]==j,2]
  }
  
  # Classificar pelo final de semana, por que eu quis =)
  xy = t(as.matrix(xy))
  xy = t(xy[order(xy[,2],decreasing=T), ])

  # Em alguns gráficos a legenda ficou sobreposta ao gráfico
  if(num==4) posicao_legenda = list(x="topleft")
  else posicao_legenda = list(x="topright")
  
  # Cria os pdf das figuras
  nomepdf = paste('output/questionario1','pergunta',num,'.pdf',sep="")
  pdf(nomepdf)
    par(mar = c(11, 7, 4.1, 7),
        cex.axis = .7,
        cex.main=0.9)

    bp = barplot(xy,
        main=pergunta,
        beside=T,
        ylab = 'quantidade de pessoas',
        las=2,
        args.legend = posicao_legenda,
        legend=rownames(xy),
        xaxt = 'n',
        col = c('yellow','red'))

    # Inclinar labels no eixo x
    text(seq(2,3*length(colnames(xy)),by=3), 
         par('usr')[3], 
         labels = colnames(xy), 
         srt = 60,
         adj = 1, 
         xpd = TRUE, 
         cex=.8)

    # Coloca os valores em cima das colunas
    text(bp, xy, labels = format(xy, 4), pos = 1, cex = .75)
  dev.off()
}

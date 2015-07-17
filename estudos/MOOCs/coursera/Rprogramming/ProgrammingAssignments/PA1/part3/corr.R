load_monitor <- function(directory, i) 
{
  if (i > 0 & i < 10)         id_corrigido = paste('/00',i,sep="")
  else if (i >= 10 & i < 100) id_corrigido = paste('/0',i,sep="")
  else if (i >= 100)          id_corrigido = paste('/',i,sep="")
  
  nome_do_arquivo = paste(directory,id_corrigido,sep="")
  nome_do_arquivo = paste(nome_do_arquivo,'.csv',sep="")
  arquivo = read.csv(nome_do_arquivo,comment.char="")
  return(arquivo)
}

corr <- function(directory, threshold = 0) {
  source('../part2/complete.R')
  completos = complete(directory)
  
  correlations = c()
  amostra = subset(completos,nobs > threshold)
  if(length(amostra)!=0)
  {
    for(i in amostra$id)
    {
      arquivo = load_monitor(directory,i)
      dummy <- subset(arquivo,!is.na(nitrate) & !is.na(sulfate))
      linha <- cor(dummy$sulfate,dummy$nitrate)
      correlations<-append(correlations,linha)
    }
  }
  return(correlations)
}
# Retorna média do poluente especificado nas estações espeficicadas. 

pollutantmean <- function(directory, pollutant, id=1:332) {
  tudo = vector()
  for (i in id)
  {
    if (i > 0 & i < 10)         id_corrigido = paste('/00',i,sep="")
    else if (i >= 10 & i < 100) id_corrigido = paste('/0',i,sep="")
    else if (i >= 100)          id_corrigido = paste('/',i,sep="")
    
    nome_do_arquivo = paste(directory,id_corrigido,sep="")
    nome_do_arquivo = paste(nome_do_arquivo,'.csv',sep="")
    print(nome_do_arquivo)
    x = read.csv(nome_do_arquivo)
    tudo  = append(tudo,x[,pollutant])
  }
  return(mean(tudo,na.rm=T))
}



complete <- function(directory, id = 1:332) {
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  retorno = data.frame()
  for (i in id)
  {
    if (i > 0 & i < 10)         id_corrigido = paste('/00',i,sep="")
    else if (i >= 10 & i < 100) id_corrigido = paste('/0',i,sep="")
    else if (i >= 100)          id_corrigido = paste('/',i,sep="")
    
    nome_do_arquivo = paste(directory,id_corrigido,sep="")
    nome_do_arquivo = paste(nome_do_arquivo,'.csv',sep="")
    x = read.csv(nome_do_arquivo,comment.char="")
    # São considerados casos completos quando há medida
    # de nitrato e sulfato.
    completos = sum(!is.na(x[,2]) & !is.na(x[,3]) )
    retorno <- rbind(retorno,c(i,completos))
  }
  colnames(retorno) <- c('id','nobs')
  return(retorno)
}
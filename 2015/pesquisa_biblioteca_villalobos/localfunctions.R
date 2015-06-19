computing_letters <- function(letras)
{
  # Transforma array em uma string
  letras=paste(letras,collapse="")
  
  # Remove espaços e vírgulas
  letras = gsub(' ','',letras)
  letras = gsub(',','',letras)
  
  # Transforma string em vetor novamente
  letras=strsplit(letras,'')
  
  # Frequências das respostas
  letras = table(letras)
  
  # Formato escolhido para trabalhar
  letras=as.matrix(letras)
  letras=t(letras)
  
  return(letras)
}
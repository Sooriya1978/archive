corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  lista<-list.files(path=directory)
  vetor = vector("numeric",length=0)
  for (i in lista) {
    name<-paste(directory,i,sep="/")
    data<-read.table(file=name,sep=",",header=T)
    if(sum(complete.cases(data)) > threshold) {
      NoNas <- subset(data,complete.cases(data))
      vetor<-c(vetor,cor(NoNas$nitrate,NoNas$sulfate))
    }
  }
  vetor
}

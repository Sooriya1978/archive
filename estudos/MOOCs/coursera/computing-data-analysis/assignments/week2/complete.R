complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## Your code here
  firstLine =TRUE
  
  for (i in id ) {
    i<- as.integer(i)
    if(i<10) i <- paste(0,i,sep="")
    if(i<100) i <- paste(0,i,sep="")
    name <- paste(i,"csv",sep=".")
    name<-paste(directory,name,sep="/")
    data<-read.table(file=name,sep=",",header=T)
    soma = sum(complete.cases(data))
    if (firstLine) { 
      dados<- data.frame(id=as.integer(i),nobs=soma)
      firstLine = FALSE
    }
    else {
      dados<-rbind(dados,c(as.integer(i),soma))
    }
  } 
  dados
}
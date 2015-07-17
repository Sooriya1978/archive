teste <- function(){
  x<-matrix(1:6,2,3)
  for(i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
      print("linha")
      print(i)
      print("coluna")
      print(j)
      print("valor")
      print(x[i])
    }
  }

}
teste <-function () { 
  x<-c("a","b","c","d")
  print("metodo 1")
  for (i in 1:4){
    print(x[i])
  }
  print ("metodo 2")
  for (i in seq_along(x)){
    print(x[i])
  }
  print("metodo 3")
  for (letter in x){
    print (letter)
  }
  print("metodo 4")
  for(i in 1:4) print(x[i])
}
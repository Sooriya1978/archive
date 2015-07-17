teste <- function() {
  z<-5
  while(z>=3 && z<=10) {
    print(z)
    moeda<-rbinom(1,1,0.5) #distribuição binomial 0 e 1 probabilidade 1/2
    print("moeda: ")
    print(moeda)
    if(moeda==1){
      z<-z+1
    } else {
      z<-z-1
    }
  }
}
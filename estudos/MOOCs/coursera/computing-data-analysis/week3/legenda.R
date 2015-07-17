legenda1<-function(){
  x<-rnorm(100)
  y<-x+rnorm(100,sd=0.5)
  plot(x,y,
       xlab=substitute(bar(x)==k,list(k=mean(x))),
       ylab=substitute(bar(y)==k,list(k=mean(y)))
  )
}
legenda2<-function(){
  par(mfcol=c(2,2))
  for (i in 1:4){
    x<-rnorm(100)
    hist(x,main=substitute("Grafico numero: " *theta==num,list(num=i)))
  }
}
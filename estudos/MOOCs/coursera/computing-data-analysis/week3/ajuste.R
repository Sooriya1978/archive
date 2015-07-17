ajuste1 <-function(){
  set.seed(20)
  x<-rnorm(100)
  e<-rnorm(100,0,2)
  y<-0.5+2*x+e
  plot(x,y)
}

ajuste2 <-function(){
  set.seed(20)
  x<-1:100
  e<-rnorm(100,0,1)
  y<-1.5+3*x+e
  plot(x,y,xlab="eixo x")
}

ajuste3 <-function(){
  set.seed(1)
  x<-rnorm(100)
  log.mu<-0.5+0.3*x
  y<-rpois(100,exp(log.mu))
  plot(x,y)
}
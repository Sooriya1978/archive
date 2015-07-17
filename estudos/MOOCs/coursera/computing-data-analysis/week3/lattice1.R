lattice1 <- function(){
  library(lattice)
  library(nlme)
  xyplot(distance ~ age | Subject, data = Orthodont, type="b")
}

lattice2<- function(){
  library(lattice)
  library(nlme)
  x<-rnorm(100)
  y<-x + rnorm(100,sd=0.5)
  f<-gl(2,50,labels=c("grupo1","grupo2"))
  xyplot(y~x|f, panel=function(x,y,...){
    panel.xyplot(x,y,...)
    panel.lmline(x,y,col="red")
    panel.abline(h=median(y), lty=2)
  })
}
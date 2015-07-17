ozone1<-function(){
  library(lattice)
  data(environmental)
  #xyplot(ozone~radiation,data=environmental, main="Ozone vs Radiantion")
  xyplot(environmental[,1]~environmental[,2] , 
         data=environmental, 
         main="Ozone vs Radiation",
         ylab=expression("Solar radiation"),
         xlab=expression(" Ozonio (ppb) "  * O[3] * " ou Ozone se preferir" ))
}

ozone2<-function(){
  library(lattice)
  data(environmental)
  temperatura.cut<-equal.count(environmental$temperature,4) #divide em 4 partes com num iguais
  xyplot(ozone~radiation | temperatura.cut,  data=environmental, main="Ozone vs Radiantion")
}
ozone3<-function(){
  library(lattice)
  data(environmental)
  temperatura.cut<-equal.count(environmental$temperature,4) #divide em 4 partes com num iguais
  xyplot(ozone~radiation | temperatura.cut,  data=environmental, layout = c(1,4), main="Ozone vs Radiantion")
}

ozone4<-function(){
  library(lattice)
  data(environmental)
  temperatura.cut<-equal.count(environmental$temperature,4) #divide em 4 partes com num iguais
  xyplot(ozone~radiation | temperatura.cut,  
         data=environmental, 
         pch = 20,
         as.table=TRUE, 
         main="Ozone vs Radiantion",
         panel = function(x,y,...){
           panel.xyplot(x,y,...)
           fit<-lm(y~x)
           panel.abline(fit,lwd=2)
         })
}

ozone5<-function(){
  library(lattice)
  data(environmental)
  temperatura.cut<-equal.count(environmental$temperature,4) #divide em 4 partes com num iguais
  xyplot(ozone~radiation | temperatura.cut,  
         data=environmental, 
         pch = 20,
         as.table=TRUE, 
         xlab = "Solar Radiation",
         ylab = "Ozone (ppb)",
         main="Ozone vs Radiantion",
         panel = function(x,y,...){
           panel.xyplot(x,y,...)
           panel.loess(x,y)
         })
}

ozone6<-function(){
  library(lattice)
  data(environmental)
  temperatura.cut<-equal.count(environmental$temperature,4) #divide em 4 partes com num iguais
  vento.cut<-equal.count(environmental$wind,4) #divide em 4 partes com num iguais
  xyplot(ozone~radiation | temperatura.cut * vento.cut,  
         data=environmental, 
         pch = 20,
         as.table=TRUE, 
         xlab = "Solar Radiation",
         ylab = "Ozone (ppb)",
         main="Ozone vs Radiantion",
         panel = function(x,y,...){
           panel.xyplot(x,y,...)
           panel.loess(x,y)
         })
}

ozone7<-function(){
  library(lattice)
  data(environmental)
  splom(~environmental)
}

ozone8<-function(){
  library(lattice)
  data(environmental)
  temperatura.cut<-equal.count(environmental$temperature,4) #divide em 4 partes com num iguais
  histogram(~ozone | temperatura.cut, data = environmental, as.table=TRUE)
}
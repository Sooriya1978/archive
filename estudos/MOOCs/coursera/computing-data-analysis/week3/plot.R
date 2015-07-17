graficos <- function(){
  x<-rnorm(100)
  y<-x+rnorm(100)
  par(mar=c(4,4,2,2))
  par(mfrow=c(2,2)) # 4 graficos up-dow poderia ser mfcol 
  #example(points)
  #grafico 1
  plot(x,y,pch=20,col="blue",xlab="Valores de x",ylab="valores de y")
  title("Graficos de exemplo 1")
  text(2,-2,"algum texto")
  #grafico2
  plot(y,x,pch=21)
  title("Graficos de exemplo 2")
  legend("topleft",legend="mulher", pch=21)
  fit<-lm(y~x)
  abline(fit,lwd=2,col="red")
  #gráfico 3
  grupos<-gl(2,50,labels=c("Male","Female"))
  plot(x,y,pch=20,type="n") #plota um gráfico sem dados
  points(x[grupos=="Male"],y[grupos=="Male"], col="blue") #points no grafico anterior
  points(x[grupos=="Female"],y[grupos=="Female"], col="red")
  legend("topright",legend="homens",pch=20,col="blue")
  legend("topleft",legend="mulheres",pch=20,col="red") 
}
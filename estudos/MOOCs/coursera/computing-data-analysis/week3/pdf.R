funcao1<- function(){
  pdf(file="testeplot.pdf")
  x<-rnorm(100)
  hist(x)
  dev.off()
}
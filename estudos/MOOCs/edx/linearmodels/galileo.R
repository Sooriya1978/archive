# Um objeto é lançado do alto de um prédio (V0=0).
# S = S0 + v0*t + 0.5*g^2*t^2 
#Inventando pontos  
set.seed(1) 
g <- 9.8                 # gravidade em m/s
n <- 20                  # Quantidade de vezes que foi feito "medidas".
t <- seq(0,3,len=n)      # tempos em que as posições foram "medidas" entre 0 e 3 segundos.
S <- 56.67 - 0.5*g*t^2 
S <- S + rnorm(n,sd=1)   # Adicionando "flutuações" nas medidas
plot(t,S,ylab="Posição (metros)",xlab="Tempo (segundos)")

lines(t,S,col=2)
LSE: equação minimos quadrados
tt2 <-tt^2
fit <- lm(y~tt+tt2)
summary(fit)$coef

Calculando a própria RSS
rss <- function(Beta0,Beta1,Beta2){
  r <- y - (Beta0+Beta1*tt+Beta2*tt^2)
  return(sum(r^2))
}

Beta2s<- seq(-10,0,len=100)
plot(Beta2s,sapply(Beta2s,rss,Beta0=55,Beta1=0),
     ylab="RSS",xlab="Beta2",type="l")
##Let's add another curve fixing another pair:
Beta2s<- seq(-10,0,len=100)
lines(Beta2s,sapply(Beta2s,rss,Beta0=65,Beta1=0),col=2)

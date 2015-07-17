x1 = c(5,8,9,19,50)
px1 = c(.5,.2,.2,.06,.04)
media1 = sum(x1*px1)
variancia1 = sum( (x1-media1)^2 *px1 )
despad1 = sqrt(variancia1)
# Se a distribuição é simétrica, a média e a mediana são iguais 
plot(x1,px1) # skewed right 

x2 = c(0,100,200,3000)
px2= c(0.1,.2,.3,.4)
media2 = sum(x2*px2)
variancia2 = sum( (x2-media2)^2 *px2 )
variancia2*4

x3 = c(1, 1, 2, 3, 6, 10, 75)
p3 = rep(1/7,7)
media3 = sum(x3*p3)

#Questão 4 do Quiz 2
a = (0.05/0.95)*(dbinom(9,10,0.9)/dbinom(9,10,0.5))
a/(a+1)
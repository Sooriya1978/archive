setwd("~/software-carpentry/inflammation/")

weight_kg <- 55
weight_lbs <- 2.2 * weight_kg

dat<-read.csv("inflammation-01.csv",header=F)

dat[1:4,1:10]

dat[c(3,5,1),c(3,6,1)]

#paciente 4
dat[4,]
patient_4max <- max(dat[4,])
patient_4min <- min(dat[4,])
patient_4mean <- mean(t(dat[4,]))

class(dat[4,2])

# it is better do not stack functions in R

medias_colunas = apply(dat,2,mean)
medias_colunas[2]

animal = c('m','o','n','k','e','y')
animal[-1:-4]       # remove do primeiro ao quarto caracter
animal[4:1]  # os 4 primeiros caracteres invertidos 
animal[c(5,2,3)]

farh_to_kelvin<-function(temp){
  return ((temp-32)*(5/9)-273.15)
}

freezewater = farh_to_kelvin(32)
boilwater   = farh_to_kelvin(212)

text = c('this','is','a','vector')
wrapper<-function(vector){
  # add letter a in the beginning end the end os the vector
  return(c('a',vector,'a'))
}
wrapper(text)
rm(list=ls())


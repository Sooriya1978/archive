setwd("~/Desktop/coursera-Rprogramming/quizzes/week1/")

data <- read.csv("hw1_data.csv")
dim(data)
head(data)
tail(data)

# Quantos valores de O3 sao faltantes?
sum(is.na(data$Ozone))

# Media do O3:
mean(data$Ozone,na.rm=T)

# Média Solar para casos em que O3>31 e temperatura > 90.
subdata <- subset(data, Ozone>31 & Temp>90)
mean(subdata$Solar.R,na.rm=T)

# Media da temperatura no mes 6:
data6 <- subset(data,Month==6)
mean(data6$Temp,na.rm=T)

# Maximo de Ozonio em Maio:
dataMaio <- subset(data,Month==5)
max(dataMaio$Ozone,na.rm=T)

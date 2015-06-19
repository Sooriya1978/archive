setwd("~/remota/repos/archive/2014/metar2csv/")
# Transforma arquivo do METAR em um planilha "digerível" 11/07/2013
# Thiago Gomes Veríssimo
#Modelo Original da linha (334)
#14/01/2007  SBGL  141000Z   34002KT 7000 SCT008 SCT040 OVC090 24/22 Q1007=
  
#Devera ficar: 
#14/01/2007  10 00  340 02 24 22 1007 (data,hora,minuto,direcao,velocidade,temp final,tempe inicial,pressao)

#resolve problema de caracteres em pt-br
Sys.setlocale('LC_ALL','C') 

#Leitura do arquivo do METAR
arquivo <- read.table(file="data/METAR.txt",sep="\t",colClasses="character")
library(stringr)
arquivo[,4] = str_replace_all(arquivo[,4]," ","")

#Remover ausentes
arquivo <- arquivo[substr(arquivo[,4],1,7)!="Ausente",]

#Tranformando data
#arquivo[,1]<-as.POSIXct(strptime(arquivo[,1],format="%d/%m/%Y"))
#arquivo[,1]<-format(arquivo[,1],"%m/%d/%Y")

#funcao para pegar ultimos valores pela fubcao substr
substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

#Data
novatabela<-cbind(arquivo[,1])
#hora
novatabela<-cbind(novatabela,substr(arquivo[,3],3,4))
#minuto
novatabela<-cbind(novatabela,substr(arquivo[,3],5,6))
#direcao
novatabela<-cbind(novatabela,substr(arquivo[,4],1,3))
#Velocidade
novatabela<-cbind(novatabela,substr(arquivo[,4],4,5))

#Temperaturas Final e Inicial
orvalho<-vector()
ar<-vector()
for (linha in arquivo[,4]){
  tamanho_temperatura<-length(unlist(strsplit(linha,split="/")))
  auxiliar_orvalho<-substr(unlist(strsplit(linha,split="/"))[tamanho_temperatura],1,2)
  auxiliar_ar<-substrRight(unlist(strsplit(linha,split="/"))[tamanho_temperatura-1],2)
  orvalho<-append(orvalho,auxiliar_orvalho)
  ar<-append(ar,auxiliar_ar)

}
novatabela<-cbind(novatabela,ar)
novatabela<-cbind(novatabela,orvalho)

#Pressão
pressao<-vector()
for (linha in arquivo[,4]){
  if (grepl("Q",linha)) {
    auxiliar_pressao <- unlist(strsplit(linha,split="Q"))[2]
    auxiliar_pressao <- substr(auxiliar_pressao,1,4)  
  }
    
  else if(!grepl("Q",linha)){
    auxiliar_pressao <- substrRight(strsplit(linha,split="="),4)
  }
  pressao = append(pressao,auxiliar_pressao)
}
novatabela<-cbind(novatabela,pressao)

#Nomeia as colunas
colnames(novatabela)<-c("Data","hora","minuto","direcao","velocidade","TempAr","tempOrvalho","pressao")

#Salva em arquivo CSV
write.csv(novatabela,"output/output.csv",row.names=F)



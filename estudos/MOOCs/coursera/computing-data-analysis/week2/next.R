teste <- function(){
  for(i in 1:100) {
    if(i<=20){
      print("nao mostrarei a mensagem oculta")
      next
    }
    print("mensagem oculta: pirate bay")
  }
}
potencia <- function(n) {
  base <- function(x) {
    x^n # a ultima linha da função é o que ela retorna
  }
  base # a função potência retorna outra função
}
#chamada> cubo <-potencia(3)
#>cubo(7)
#ls(environment(cubo))
#get("n",environment(cubo))
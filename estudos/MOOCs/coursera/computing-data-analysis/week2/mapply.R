noise <- function(n,mean,sd){
	rnorm(n,mean,sd)
}
#rodar: mapply(noise,1:5,rnorm(5,2),1)

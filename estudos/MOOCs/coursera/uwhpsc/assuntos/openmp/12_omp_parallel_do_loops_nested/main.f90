program main 
  use omp_lib
  implicit none
  integer, parameter :: n=3,m=3
  integer :: i,j
  real(kind=8) , dimension(n,m) :: matriz
  
  print *, "Dada um matriz 3x3, vamos setar todos elementos como a soma de linha mais coluna, usando paralelismo"
  
  !$omp parallel do private(i,j)
    do i=1,n
      do j=1,m
        matriz(i,j) = i + j
      enddo
    enddo
  !$omp end parallel do
  
  write (*,*) matriz
end program main

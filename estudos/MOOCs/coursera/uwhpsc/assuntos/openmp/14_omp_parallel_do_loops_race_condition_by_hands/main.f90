program main
  use omp_lib
  implicit none
  integer, parameter :: n = 3
  real(kind=8),dimension(n) :: x
  real(kind=8) :: norma_vetor,minhasoma
  integer :: i
   
  x = (/1.d0,2.d0,3.d0/)   
  norma_vetor = 0.d0
  print *, "Esse é o mesmo exemplo que anterior, mas sem usar race condition" 
  !$omp parallel shared(norma_vetor) private(i,minhasoma)
    !$omp do
    do i=1,n
      minhasoma = minhasoma + abs(x(i))
    enddo
    !omp end do
  
    !Cada thread atualiza a norma global do vetor
    !$omp critical
      norma_vetor = norma_vetor + minhasoma
    !$omp end critical

  !$omp end parallel
  print *,norma_vetor
end program main

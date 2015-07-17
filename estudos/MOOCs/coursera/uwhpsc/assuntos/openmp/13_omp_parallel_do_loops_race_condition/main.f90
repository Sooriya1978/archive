program main
  use omp_lib
  implicit none
  integer, parameter :: n = 3
  real(kind=8),dimension(n) :: x
  real(kind=8) :: norma_vetor
  integer :: i
   
  x = (/1.d0,2.d0,3.d0/)   
  norma_vetor = 0.d0
  print *, "neste exemplo, a variável norma_vetor será atualizada por threads diferentes." 
  print *, "podemos declará-la como private, e no final somarmos o resultado, mas é mais "
  print *, "fácil usar race condition" 
  !$omp parallel do private(i) reduction(+ : norma_vetor)
    do i=1,n
      norma_vetor = norma_vetor + abs(x(i))
    enddo
  !$omp end parallel do
  print *,norma_vetor
end program main

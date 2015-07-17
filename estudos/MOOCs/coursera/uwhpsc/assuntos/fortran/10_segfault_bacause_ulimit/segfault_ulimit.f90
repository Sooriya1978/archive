!Para funcionar, rodar comando abaixo (que aumenta o tamanho permitido da pilha):
! $ ulimit -s unlimited 
! No MAC: $ ulimit -s hard

program main
  use omp_lib
  implicit none
  integer, parameter :: i = 3000000
  real(kind=8),dimension(i) :: x
  real(kind=8) :: auxiliar
  integer :: n
  print *,"Me compile com -fopenmp"
  !$omp parallel do private(n) 
    do n=1,i
      x(n) = n**2
    enddo
  !$omp end parallel do
  print *,x
end program main

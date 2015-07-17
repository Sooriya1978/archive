program main
  use omp_lib
  implicit none
  integer, parameter :: i = 5
  real(kind=8),dimension(i) :: x
  real(kind=8) :: auxiliar
  integer :: n
  !n por padrão já é private, mas auxiliar temos que declarar
  
  !As duas linhas abaixo producem o mesmo resultado:
  
  !omp parallel do private(n,auxiliar) !Opção 1
  !$omp parallel do default(private) shared(x) !Opção 2
    do n=1,i
      auxiliar = n**2
      x(n) = auxiliar
    enddo
  !$omp end parallel do
  print *,x
end program main

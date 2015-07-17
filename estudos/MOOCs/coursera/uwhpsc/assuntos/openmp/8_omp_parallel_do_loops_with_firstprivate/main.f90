program main
  use omp_lib
  implicit none
  integer, parameter :: i = 5
  real(kind=8),dimension(i) :: x
  real(kind=8) :: auxiliar,dx
  integer :: n
  dx = 10.d0
  !n por padrão já é private, mas auxiliar temos que declarar
  !como dx só e usada, mas não alterada durante o loop, se usássemos private
  !dx não seria inicializada, por isso temo que usar firstprivate()
  !$omp parallel do firstprivate(dx) private(auxiliar,n) 
    do n=1,i
      auxiliar = n**2
      x(n) = auxiliar*dx
    enddo
  !$omp end parallel do
  print *,x
end program main

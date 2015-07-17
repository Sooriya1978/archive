program main
  use omp_lib
  implicit none
  integer, parameter :: i = 50
  real(kind=8) :: x
  integer :: n

  !Cada thread fork terá suas próprias variáveis: i,n,x
  !$omp parallel do private(n,x)
    do n=1,i
      x = n**2
      print *,"Eu sou n = ",n
      print *,"e eu sou x = ",x
    enddo
  !$omp end parallel do
end program main

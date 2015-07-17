program main
  use omp_lib
  implicit none
  integer, parameter :: i = 3
  real(kind=8),dimension(i) :: x
  integer :: n

  !$omp parallel do private(n) 
    do n=1,i
      x(n) = n**2 
    enddo
  !$omp end parallel do
  print *,x
end program main

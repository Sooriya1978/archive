program main
  use omp_lib
  implicit none 
  real (kind=8) :: x,dx,pisum,pi
  integer :: n,i
  
  n=1000  
  dx = 1.d0/n
  pisum = 0.d0

  !$omp parallel do reduction(+: pisum) private(x)
  do i=1,n
    x = (i-0.5d0)*dx
    pisum = pisum + 1.d0 / (1.d0 + x**2)
  enddo
  !$omp end parallel do
  pi = 4.d0*dx*pisum

  print *,"pi: ",pi
end program main

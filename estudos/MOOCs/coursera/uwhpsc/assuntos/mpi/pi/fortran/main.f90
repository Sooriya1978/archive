program main
  implicit none 
  real (kind=8) :: x,dx,pisum,pi
  integer :: n,i
  n=1000
  
  dx = 1.d0/n
  do i=1,n
    x = (i-0.5d0)*dx
    pisum = pisum + 1.d0 / (1.d0 + x**2)
  enddo
  pi = 4.d0*dx*pisum

  print *,"pi: ",pi
end program main

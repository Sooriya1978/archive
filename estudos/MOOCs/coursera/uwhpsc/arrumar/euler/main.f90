program main
  implicit none
  integer :: n,i
  real (kind=8), dimension(:), allocatable :: y
  real (kind=8) :: dt

  print *, "Example of Euler's Method, we are solving: "
  print *, "y(t) = exp(2t) for 0<t<5 "
  print *, "Initial Values: y(0) = 1 and y'(t) = 2y(t) "
  print *, "This example ilustrates a kind of code that is hard to work with parallel"
  n = 50 ! Number of step to reach t = 5
  allocate(y(n))
  y(1) = 1.d0
  dt = 0.01 !Time step

  do i=2,n
    y(i) = y(i-1) + 2.d0*dt*y(i-1)
  enddo
  print *,y
  deallocate(y)
end program main

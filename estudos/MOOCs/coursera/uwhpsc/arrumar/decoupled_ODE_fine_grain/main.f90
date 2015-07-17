program main
  implicit none
  integer, parameter :: n = 100000
  integer :: i,steps,m
  real (kind=8), dimension(n) :: u,eta,c
  real (kind=8) :: dt = 0.0001
  
  print *, "This example is completely decoupled. We can solve all simultaneously without communication"
  eta = 1.d0 !initialize all values o array eta
  c = 1.d0  

  !$omp parallel do
    do i=1,n
      u(i) = eta(i)
    enddo
  !$omp end parallel do
  
  steps = 1000
  do m=1,steps 
    !$omp parallel do
      do i=1,n
        u(i) = (1.d0 +dt*c(i))*u(i) 
      enddo
    !$omp end parallel do
  enddo
end program main

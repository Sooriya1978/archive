program main
  use myfunctions, only: myfcn 
  implicit none

  integer :: i  
  real (kind=8), dimension(3) :: a

  a = (/1.d0,2.d0,3.d0/)

  !$omp parallel do
  do i=1,3
    print *, "if we call the function we get: ",myfcn(a(i))
  enddo
  !$omp end parallel do
end program main

!gfortran -c  myfunctions.f90 
!gfortran -fopenmp -c  main.f90
!gfortran -fopenmp main.o myfunctions.o

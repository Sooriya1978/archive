program main
  use circlemod, only: pi, area
  implicit none
  real (kind=8) :: a
  
  call initialize() !Set the value of global variable pi
  print *, "the value of pi is: ",pi
  
  a = area(2.d0)
  print *, "The area calculed for r = 2 is: ", a
end program main

!gfortran -c circlemod.f90 initialize.f90  main.f90
!gfortran  circlemod.o initialize.o main.o 


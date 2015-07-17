program test1
  use newtonmod, only: newtonsolve
  use functions, only: g, gp

  implicit none
  real (kind=8) :: x,x0,fx,x0vals(4)
  integer :: i,itest
  logical :: debug !.true. or .false.
  
  print *, "Test the subroutine for computing zero of f"
  !debug = .false.
  debug = .true.
  
  !values x0 to test
  x0vals = (/ -2.2d0, -1.6d0, -0.8d0, 1.45d0 /) 
  
  do itest=1,4
    x0 = x0vals(itest)
    print *, "" !blank line
    call newtonsolve(g,gp,x0,x,i,debug)
    
    print 11,x,i
11  format("The x found : ", es22.15 ,"and the number of iterations was: ",i3)

!    fx = f_sqrt(x)
!    print 12,fx
!12  format("The value of f(x) is: ",e20.15)

  enddo 

end program test1

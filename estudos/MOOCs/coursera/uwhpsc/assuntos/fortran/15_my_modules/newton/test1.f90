program test1
  use newtonmod, only: newtonsolve
  use functions, only: f_sqrt, fprime_sqrt

  implicit none
  real (kind=8) :: x,x0,fx,x0vals(3)
  integer :: i,itest
  logical :: debug !.true. or .false.
  
  print *, "Test the subroutine for computing zero of f"
  debug = .true.
  
  !values x0 to test
  x0vals = (/ 1.d0, 2.d0, 999999.d0 /) 
  
  do itest=1,3
    x0 = x0vals(itest)
    print *, "" !blank line
    call newtonsolve(f_sqrt,fprime_sqrt,x0,x,i,debug)
    
    print 11,x,i
11  format("The x found: ", e20.15 ,"The number of iteractions was: ",i3)

    fx = f_sqrt(x)
    print 12,fx
12  format("The value of f(x) is: ",e20.15)

    if (abs(x - 2.d0) > 1.d-14) then
      print 13,x
13    format("*** unexpected value of x: ",e20.15)
    endif

  enddo 

end program test1

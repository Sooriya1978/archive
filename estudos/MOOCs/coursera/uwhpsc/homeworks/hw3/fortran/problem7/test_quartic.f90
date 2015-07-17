program test_quartic
  use newtonmod, only: newtonsolve,tolerance
  use functions, only: f_quartic, fprime_quartic,epsilon

  implicit none
  real (kind=8) :: x,x0,fx,x0vals(1),epsilons(3),tolerances(3),xstar
  integer :: i,itest,iepsilons,itolerances
  logical :: debug !.true. or .false.

  !using global variable: tolerance and epsilon

  epsilons = (/1.d-4, 1.d-8, 1.d-12/)
  tolerances = (/1.d-5, 1.d-10, 1.d-14/)
  x0vals = (/ 4.d0 /) 

  
  debug = .false.
  !debug = .true.
  
  print *, '    epsilon        tol    iters          x                 f(x)        x-xstar' 
  do itest=1,1
    x0 = x0vals(itest)
    print 10,x0
10	format("x0 is: ",es22.15) 
    do iepsilons=1,3
      epsilon = epsilons(iepsilons) !setting global epsilon
      xstar = 1.d0 + epsilon**(0.25d0)
      do itolerances=1,3
        tolerance = tolerances(itolerances) !setting global tolerance
        call newtonsolve(f_quartic,fprime_quartic,x0,x,i,debug)
        fx = f_quartic(x)
        !print *,epsilon,tolerance,i,x,fx,x-xstar
        print 11,epsilon,tolerance,i,x,fx,x-xstar
11      format(2es13.3, i4, es24.15, 2es13.3)
      enddo
    print *, " " ! blank line
    enddo
  enddo 
 
end program test_quartic

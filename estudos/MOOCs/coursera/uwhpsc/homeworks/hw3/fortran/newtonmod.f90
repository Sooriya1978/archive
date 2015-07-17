module newtonmod
  !module parameter
  implicit none
  integer, parameter :: maxiterations = 15
  real (kind=8), parameter :: tolerance = 1.d-14

contains

subroutine newtonsolve(f,fp,x0,x,i,debug)
  ! f: function to find a root of
  ! fp: derivative of f
  ! x0: inicial guess
  ! debug: .true. or .false.
  ! x: the estimative of f(x) = 0 
  ! i: number os iterations
  implicit none 
  real (kind=8), external :: f, fp ! Because they are functions
  real (kind=8), intent(in) :: x0
  real (kind=8), intent(out) :: x
  integer , intent(out) :: i
  logical, intent(in) :: debug

  !local variables
  real (kind=8) :: deltax,fx,fprime
  integer :: k

  !Initial guess
  x = x0
   
  !debug
  if(debug) then
    print 11,x
11    format('Initial guess x: ',es22.15)
  endif

  !newton
  do k=1,maxiterations
    fx = f(x)
    fprime = fp(x)
    ! There are a lot of criteria we can use
    if(abs(fx) < tolerance) then
      exit
    endif
    
    deltax = fx/fprime

    !update x
    x = x - deltax

    if(debug) then
      print 12, k,x
12    format('After ',i3 , ' Iterations, the value of x is:  ',es22.15)
    endif
  enddo
  
  !test to see if converged
  if (k > maxiterations) then
    fx = f(x)
    if (abs(fx) > tolerance) then
      print *, "*** Warning: has no converged"
    endif
  endif
  
  !number of interations taken
  i = k -1
end subroutine newtonsolve

end module newtonmod

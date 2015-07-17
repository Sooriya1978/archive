program functions
  implicit none
  real (kind=8) :: x,y,z
  !We have to declare what type of value function f will return
  real (kind=8), external :: f
   
  y = 2.
  x = 4.
  z = f(x,y)
  print *, "z = ",z
end program functions

!Creating function f
!We have to declare what type of value function f will return
real (kind=8) function f(a,b)
  implicit none
  real (kind=8), intent(in) :: a,b
  f = a + b
  !Because the name of the function if f, the value of f is returned
end function

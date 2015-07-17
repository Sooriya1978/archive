program subroutines
  implicit none
  real (kind=8) :: x,y

  x = 7.
  call mysubroutine(x,y)
  print *, "The value of y after we call my subrotine: ", y 
end program subroutines

!Defines the Subrotine mysubrotine
subroutine mysubroutine(a,b)
  implicit none
  real (kind=8), intent(in) :: a ! Can not be modified my this routine
  real (kind=8), intent(out) :: b ! Can be modified my this routine
  b = a**2
end subroutine mysubroutine

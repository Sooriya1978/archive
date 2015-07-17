program subroutines_array
  implicit none
  real (kind=8), dimension(3) :: x,y
  integer n

  x = (/ 2.,4.,7. /)
  n =size(x)
  call mysubroutine(x,n,y)
  print *, "The value of y after we call my subrotine: ", y 
end program subroutines_array

!Defines the Subrotine mysubrotine
subroutine mysubroutine(a,i,b)
  implicit none
  integer, intent(in) :: i
  real (kind=8), dimension(i), intent(in) :: a ! Can not be modified my this routine
  real (kind=8), dimension(i), intent(out) :: b ! Can be modified my this routine
  b = a**2
end subroutine mysubroutine

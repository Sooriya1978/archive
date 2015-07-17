module myfunctions
contains

 real (kind=8) function myfcn(x)
   implicit none
   real (kind=8), intent(in) :: x
   real (kind=8) :: z ! local variable
   z = exp(x)
   myfcn = z*cos(x)
 end function myfcn

end module myfunctions

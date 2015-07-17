module functions
contains
 
  real (kind=8) function myfcn(x)
    use globals
    implicit none
    real (kind=8), intent(in) :: x
    count = count + 1
    z = exp(x) 
    myfcn = z*cos(x) + count
  end function myfcn
end module functions 

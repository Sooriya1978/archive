module circlemod
  implicit none
  real (kind=8), parameter :: pi = 3.14d0
  !In scope of the module we can only define parameter
  !variable have to be defined in fucntions or subroutines
  contains

  real (kind=8) function area(r)
    real (kind=8), intent(in) :: r
    area = pi * r ** 2 
  end function area

  real (kind=8) function circumference(r)
    real (kind=8), intent(in) :: r
    circumference = 2. * pi * r 
  end function circumference

end module circlemod

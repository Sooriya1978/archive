module circlemod
  implicit none
  real (kind=8) :: pi
  save
  !Defines pi as a global variable, that can be modify externally
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

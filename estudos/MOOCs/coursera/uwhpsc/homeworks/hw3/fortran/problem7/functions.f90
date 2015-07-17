module functions

  implicit none
  real (kind=8) :: epsilon
  save

  real (kind=8), parameter :: pi = acos(-1.d0)
contains

  real (kind=8) function f_sqrt(x)
    implicit none
    real (kind=8), intent(in) :: x
    f_sqrt = x**2 - 4.d0
  end function f_sqrt

  real (kind=8) function fprime_sqrt(x)
    implicit none
    real (kind=8), intent(in) :: x
    fprime_sqrt = 2.d0*x
  end function fprime_sqrt

  real (kind=8) function g(x)
    implicit none
    real (kind=8), intent(in) :: x
    g = x*cos(pi*x) - (1.d0 - 0.6d0*x**2)
  end function g

  real (kind=8) function gp(x)
    implicit none
    real (kind=8), intent(in) :: x
    gp = (cos(pi*x) - x*pi*sin(pi*x)) + 1.2d0*x
  end function gp
  
  real (kind=8) function f_quartic(x)
    implicit none
    real (kind=8), intent(in) :: x
    f_quartic = (x- 1.d0)**4 - epsilon
  end function f_quartic

  real (kind=8) function fprime_quartic(x)
    implicit none
    real (kind=8), intent(in) :: x
    fprime_quartic = 4.d0*((x- 1.d0)**3)
  end function fprime_quartic

end module functions

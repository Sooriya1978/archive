module mymod
  contains
  
  subroutine square_array(x,y)
    implicit none
    real (kind=8), dimension(:), intent(in) :: x
    real (kind=8), dimension(size(x)), intent(out) :: y
    y = x**2
  end subroutine square_array

end module mymod

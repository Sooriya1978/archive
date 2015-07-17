program main
  use circlemod, only: pi, area
  implicit none
  real (kind=8) :: a

  print *, "the value of pi is: ",pi
  
  a = area(2.d0)
  print *, "The area calculed for r = 2 is: ", a
end program main

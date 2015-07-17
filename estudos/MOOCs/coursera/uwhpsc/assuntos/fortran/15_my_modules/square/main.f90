program main
  use mymod
  implicit none
  real (kind=8), dimension(4) :: a,b
  
  a = (/3.,4.,9.,6./)
  call square_array(a,b)
  print *,"a: ",a 
  print *,"a squared is: ",b 
end program main

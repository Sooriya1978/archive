program main
  implicit none
  integer, parameter :: n = 3
  integer :: i,j
  real (kind=8), dimension(n) :: x  
  real (kind=8), dimension(n,n) :: y,z  

  print *, "we can use forall when we do not care about the order that loop will be executed"
  print *, "Is this way we gain performance"
  forall (i=1:n)
    x(i) = 2.d0*i
  end forall

  forall (i=1:n, j=1:n)
    y(i,j) = 2.d0*i*j
  end forall
  !Only execute if the condition is met: we call this od mask
  forall (i=1:n, j=1:n, y(i,j) .ne. 0.d0 )
    z(i,j) = 1.d0/y(i,j)
  end forall
end program main

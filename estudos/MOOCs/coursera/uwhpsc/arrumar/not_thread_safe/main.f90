program main
  use functions, only: myfcn
  implicit none
  real (kind=8), dimension(3) :: a
  integer :: i

  a = (/1,2,3/)
  !$omp parallel do
  do i=1,3
    print *, myfcn(a(i))
  enddo
  !$omp end parallel do 

end program main

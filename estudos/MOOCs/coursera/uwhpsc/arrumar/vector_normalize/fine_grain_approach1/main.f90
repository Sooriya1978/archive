program main
  implicit none
  integer, parameter :: n=5
  integer :: i
  real (kind=8), dimension(n) :: x
  real (kind=8) :: norm
  
  x = (/1,2,3,4,5/)
  norm = 0.d0

  !$omp parallel do reduction(+ : norm)
    do i=1,n
      norm = norm + abs(x(i))
    enddo
  !$omp end parallel do 
  !$omp barrier !not necessary, but I put it.

  !$omp parallel do
    do i=1,n
      x(i) = x(i)/norm
    enddo
  !$omp end parallel do

  print *,x
end program main

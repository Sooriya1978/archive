program sections
  use omp_lib, only: omp_set_num_threads
  implicit none
  integer, parameter :: n = 100000
  real (kind=8),dimension(n:n) :: x,y,z
  integer :: i
 
  !$ call omp_set_num_threads(2)

  !$omp parallel 
    !$omp sections !Split the code between two threads
      !$omp section !One thread initializes x array
        x=1.d0
      !$omp section !Simultaneously, The another thread initializes y array
        y=1.d0
    !$omp end sections
    !$omp barrier !not neccessary, sections put it automatically. Wait the two threads arrive here

    !$omp single !Only one thread will do the next code 
      print *, "Done initializations x and y"
      !single block has an implicit barrier, we can break this using nowait:
    !$omp end single nowait !while one thread executes this print, the another can go ahead and work

    !$omp do
      do i=1,n
        z(i) = x(i) + y(i)
      enddo
    !$omp end do

  !$omp end parallel
  
  print *, "max value of z is: ", maxval(z)
  
end program sections

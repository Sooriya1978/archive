program main
  use omp_lib, only: omp_set_num_threads, omp_get_thread_num
  implicit none
  integer :: i
  integer, parameter :: n=5
  real (kind=8), dimension(n) :: x
  
  print *,"This is an example to ilustrate a loop that has problem to use parallel way of working"
  print *, "because multiple threads are updating the array x. So, this code is WRONG"
  
  !$ call omp_set_num_threads(9)

  x = 1.d0 !Set all position of x as 1
  x(1) = 5.d0
  print *, "The values of x are: ",x
  !$omp parallel do
  do i=2,n
    !$ print *, "I am the thread number: ",omp_get_thread_num()
    print *,"i = ",i
    print *,"The value of x before the loop is: ",x(i)
    x(i) = x(i-1)
    print *, "The value of x after the loop is: ",x(i)
    print *, " "
  enddo
  !$omp end parallel do
  
end program main

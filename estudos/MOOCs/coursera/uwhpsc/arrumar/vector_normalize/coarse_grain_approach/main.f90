program main
  use omp_lib
  !use omp_lib, only: omp_get_thread_num, omp_set_num_threads
  implicit none
  integer, parameter :: n = 5
  integer :: i,nthreads,points_per_thread,istart,iend,thread_num
  real (kind=8), dimension(n) :: x,y
  real (kind=8) :: norm,norm_thread
  
  !Initialize norm and x
  x = (/1.d0,2.d0,3.d0,4.d0,5.d0/)
  norm = 0.d0

  nthreads = 1
  !$ nthreads = 4 
  !$ call omp_set_num_threads(nthreads)
  print *, "We are using ", nthreads, " threads."

  ! Determine how many points to handle with each thread.
  ! Note that dividing two integers and assigning to an integer will
  ! round down if the result is not an integer.  
  ! This, together with the min(...) in the definition of iend below,
  ! insures that all points will get distributed to some thread.
  points_per_thread = (n + nthreads -1)/nthreads
  print *, "points per thread: ", points_per_thread

  !$omp parallel private(i,norm_thread, &
  !$omp                  istart,iend,thread_num)
    thread_num = 0
    !$ thread_num = omp_get_thread_num() 
    istart = thread_num * points_per_thread + 1
    iend = min( (thread_num+1)*points_per_thread, n )
    
    norm_thread = 0.d0
    do i=istart,iend
      norm_thread = norm_thread + abs(x(i))
    enddo

    !update global norm
    !$omp critical
      norm = norm + norm_thread
    !$omp end critical
    !$omp barrier !needed here

    do i=istart,iend
      y(i) = x(i)/norm
    enddo
  !$omp end parallel
  print *,y
end program main

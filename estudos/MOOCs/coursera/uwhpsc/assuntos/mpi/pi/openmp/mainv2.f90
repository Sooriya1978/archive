program main
  use omp_lib
  implicit none 
  real (kind=8) :: x,dx,pisum,pi,pisum_thread
  integer :: n,i, points_per_thread,istart,iend,thread_num,nthreads
  
  n=1000  
  dx = 1.d0/n
  pisum = 0.d0
  
  nthreads = 2
  points_per_thread = (n + nthreads - 1)/nthreads

  !$omp parallel private(x,i,pisum_thread,istart,iend,thread_num)
  !$ thread_num = omp_get_thread_num()
  istart = thread_num*points_per_thread + 1
  iend = min( (thread_num+1)*points_per_thread,n )
  pisum_thread = 0.d0
  do i=istart,iend
    x = (i-0.5d0)*dx
    pisum_thread = pisum_thread + 1.d0 / (1.d0 + x**2)
  enddo
  
  !$omp critical
    pisum = pisum + pisum_thread
  !$omp end critical
  !$omp end parallel

  pi = 4.d0*dx*pisum

  print *,"pi: ",pi
end program main

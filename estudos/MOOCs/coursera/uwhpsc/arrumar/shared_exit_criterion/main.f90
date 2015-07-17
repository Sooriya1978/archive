program main
  use omp_lib
  implicit none
  real (kind=8), dimension(100) :: u,c
  real (kind=8) :: dt,umax, umax_thread
  integer :: n, nthreads,points_per_thread,thread_num, m, i, istart,iend,nsteps
  logical :: debug

  debug = .true.
  
  nthreads = 1
  !$ nthreads = 4
  !$ call omp_set_num_threads(nthreads)

  n = 100 ! Number of ODE

  points_per_thread = (n + nthreads -1)/nthreads

  u = 1.d0
  do i=1,n
    c(i) = dble(i-n/2) !dble means double
  enddo

  dt = 0.01
  nsteps = 1000
  umax = 100

  !$omp parallel private(i,istart,iend,m,umax_thread,thread_num)
    thread_num = 0
    !$ thread_num = omp_get_thread_num()
    istart = thread_num * points_per_thread + 1
    iend = min((thread_num+1) * points_per_thread, n)
    
    !$omp critical
      print 201,thread_num,istart,iend
    !$omp end critical
201 format("Thread: ",i2," will take i= ",i6, " throught i= ",i6)

    do m=1,nsteps
      if(debug) then
        print 301, thread_num, m, umax
301 format("+++ begin loop, thread = ",i3, " m = ", i4, "umax = ", f8.3 )
      endif
      umax_thread = 0.d0
      !$omp single
        umax = 0.d0
      !$omp end single

      do i=istart,iend
        u(i) = (1.d0 + c(i)*dt) * u(i)
        umax_thread = max(umax_thread, u(i))
      enddo
      !update global
      !$omp critical
        umax = max(umax,umax_thread)
      !$omp end critical 
      ! make sure all have updated umax before proceeding:
      !$omp barrier

      if (umax > 100) then
        if (debug) then
          print 302, thread_num, m, umax, umax_thread
302       format("+++ umax>100: exit  thread ",i3," m = ",i4,"  umax = ",f8.3,"  umax_thread = ",f8.3)
        endif
        exit
      endif

      if (debug) then
        print 303, thread_num, m, umax, umax_thread
303     format("+++ umax<100        thread ",i3," m = ",i4,"  umax = ",f8.3,"  umax_thread = ",f8.3)
      endif
      ! make sure all threads are done testing umax before going
      ! on to next iteration (where umax is re-initialized to 0).
      !$omp barrier
    enddo

  !$omp end parallel

  print *,"umax = ",umax
end program main

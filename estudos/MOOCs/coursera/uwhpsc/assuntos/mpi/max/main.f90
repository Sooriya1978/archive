program main
  use mpi
  implicit none 
  real (kind=8) :: xnorm_proc, xnorm
  integer :: n,i, points_per_proc,istart,iend,proc_num,ierr,numprocs
  real (kind=8), dimension(4) :: x
  
  x = (/1.d0,2.d0,30.d0,4.d0/)
  
  call MPI_INIT(ierr)
  call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
  call MPI_COMM_RANK(MPI_COMM_WORLD,proc_num,ierr)
  if(proc_num==0) then
    print *, "using ",numprocs, " processors, please, type a n: "
    read *,n
  endif

  !broadcast to all processes (share the value of n from proc 0, the 'master'):
  call MPI_BCAST(n,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)
  !point per proc

  points_per_proc = (n + numprocs -1)/numprocs
  if(proc_num ==0) then
    print *, "points per proc ", points_per_proc
  endif
  
  istart = proc_num*points_per_proc + 1
  iend = min( (proc_num+1)*points_per_proc,n )

  print '("Process ",i2," will take i = ",i6," through i = ",i6)', &
          proc_num, istart, iend

  xnorm_proc = 0.d0
  do i=istart,iend
    xnorm_proc = max(xnorm_proc,abs(x(i)))
  enddo
  
  call MPI_REDUCE(xnorm_proc,xnorm,1,MPI_DOUBLE_PRECISION,MPI_MAX,0,MPI_COMM_WORLD,ierr)
  
  !O processo número 0 é o processo 'mestre'  
  if(proc_num==0) then
    print *,"norm of x: ",xnorm
  endif
  call MPI_FINALIZE(ierr)
end program main
!apt-get install libopenmpi-dev
!apt-get install mpi-default-bin
!mpif90 main.f90
!mpiexec -n 4 a.out

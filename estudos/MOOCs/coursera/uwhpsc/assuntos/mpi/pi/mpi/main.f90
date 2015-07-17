program main
  use mpi
  implicit none 
  real (kind=8) :: x,dx,pisum,pi,pisum_proc
  integer :: n,i, points_per_proc,istart,iend,proc_num,ierr,numprocs
  
  
  call MPI_INIT(ierr)
  call MPI_COMM_SIZE(MPI_COMM_WORLD,numprocs,ierr)
  call MPI_COMM_RANK(MPI_COMM_WORLD,proc_num,ierr)
  if(proc_num==0) then
    print *, "using ",numprocs, " processors, please, type a n: "
    read *,n
  endif

  !broadcast to all processes (share the value of n from proc 0, the 'master'):
  call MPI_BCAST(n,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)
  dx = 1.d0/n

  !point per proc

  points_per_proc = (n + numprocs -1)/numprocs
  if(proc_num ==0) then
    print *, "points per proc ", points_per_proc
  endif
  
  istart = proc_num*points_per_proc + 1
  iend = min( (proc_num+1)*points_per_proc,n )

  print '("Process ",i2," will take i = ",i6," through i = ",i6)', &
          proc_num, istart, iend

  pisum_proc = 0.d0
  do i=istart,iend
    x = (i-0.5d0)*dx
    pisum_proc = pisum_proc + 1.d0 / (1.d0 + x**2)
  enddo
  
  call MPI_REDUCE(pisum_proc,pisum,1,MPI_DOUBLE_PRECISION,MPI_SUM,0,MPI_COMM_WORLD,ierr)
  
  !O processo número 0 é o processo 'mestre'  
  if(proc_num==0) then
    pi = 4.d0 * dx * pisum
    print *,"pi: ",pi
  endif
  call MPI_FINALIZE(ierr)
end program main
!apt-get install libopenmpi-dev
!apt-get install mpi-default-bin
!mpif90 main.f90
!mpiexec -n 4 a.out

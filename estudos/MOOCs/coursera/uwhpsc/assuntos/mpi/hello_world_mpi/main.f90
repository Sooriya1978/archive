program main
  use mpi
  implicit none
  integer :: ierr,numprocs,proc_num

  call mpi_init(ierr)
    !MPI_COMM_WORLD é um comunicator
    call mpi_comm_size(MPI_COMM_WORLD,numprocs,ierr)
    call mpi_comm_rank(MPI_COMM_WORLD,proc_num,ierr)

    print *, 'Hello, from process ', proc_num, &
    ' of ', numprocs, ' processes'
   
  call mpi_finalize(ierr)
end program main
!apt-get install libopenmpi-dev
!apt-get install mpi-default-bin
!mpif90 main.f90
!mpiexec -n 4 a.out


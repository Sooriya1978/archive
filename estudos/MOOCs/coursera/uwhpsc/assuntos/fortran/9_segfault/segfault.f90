program segfault
  implicit none
  real (kind=8) :: a(3)
  integer :: i
  do i=1,1000
    a(i) = 5.
    print *,"The value of a(i)", a(i)
  enddo
end program segfault

!Compiling, given tags for debuging
!gfortran -fbounds-check segfault.f90

!Debug using gdb
!apt-get install gdb
!gfortran -g segfault.f90
!gdb a.out
!run
!p i

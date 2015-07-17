program usingfirstmodule
  use firstmodule, only: sub1

  print *, "And I am the main program"
  call sub1()
end program usingfirstmodule

!gfortran usingfirstmodule.f90 firstmodule.f90

!or

!gfortran -c firstmodule.f90
!gfortran -c usingfirstmodule.f90 
!gfortran firstmodule.o usingfirstmodule.o -o a.out

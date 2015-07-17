program main
  print *,"That is the main part of this example project using make"
  call sub1()
  call sub2()
end program main

!Compinling the main program and the dependencies: 
!In one time
!gfortran main.f90 sub1.f90 sub2.f90 -o main.out

!In steps
!gfortran -c main.f90 sub1.f90 sub2.f90 
!gfortran  main.o sub1.o sub2.o -o main.out

!if we change, for example, only sub1.f90, we can re-compile it and link them together:
!gfortran -c sub2.f90 
!gfortran  main.o sub1.o sub2.o -o main.out

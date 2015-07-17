program first_openmp
  use omp_lib   
  implicit none
  integer :: a
  print *,"Por favor, use a flag -fopenmp para compilar!"
  print *,"Assim: gfortran -fopenmp main.f90"
  !$ print *, "Compilado com a flag -fopenmp, parabéns!!!!"
end program first_openmp

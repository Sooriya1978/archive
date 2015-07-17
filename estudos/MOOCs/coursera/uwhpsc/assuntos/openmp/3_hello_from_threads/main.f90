program main
  use omp_lib
  implicit none
  !$ call omp_set_num_threads(2)
  !$ print *,"Compilado com -fopenmp"
   
  !$omp parallel !Dividi a thread principal em duas
    !$omp critical !Força as thread serem sequênciais e não simulâneas(não compartilham memória), isto é, as duas thread vão executar duas vezes esse bloco de código.
    !$ print *, "Olá, eu sou a thread número: ",omp_get_thread_num() 
    !$omp end critical 
  !$omp end parallel
end program main

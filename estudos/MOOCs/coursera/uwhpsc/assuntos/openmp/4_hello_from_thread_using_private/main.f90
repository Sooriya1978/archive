program main
  use omp_lib
  implicit none
  integer :: thread_number

  !$call omp_set_num_threads(2) 
  !Por padrão todas variáveis são shared (compartilham memória). 
  !$omp parallel private(thread_number)
    !$ thread_number = omp_get_thread_num() 
    
    !$omp critical
      !$ print *,"Olá, eu sou a thread número: ",thread_number
    !$omp end critical
     
  !$omp end parallel  
end program main

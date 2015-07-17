program main 
  use omp_lib
  implicit none
  integer , parameter :: i=7
  real(kind=8), dimension(i) :: x
  real(kind=8) :: y
  integer :: n, thread_number
  y = 2.d0
  !firstprivate(y) para y em cada thread inicializar com 2.d0
  !lastprivate(y) para y finalizar o loop com o valor da última thread que atualizou y 
  !$omp parallel do firstprivate(y) lastprivate(y)
    do n=1,i
      y = y + 10.d0
      x(n) = y
      !omp critical
        thread_number =  omp_get_thread_num()
        print *," Thread Number = ",thread_number, " n= ", n, " x(n)= ", x(n), " y = ", y
      !omp end critical
    enddo 
  !$omp end parallel do
  !o interessante que o resultado é 32, executado pela thread que executa n=7.
  print *, "no final das contas y = ",y
end program main

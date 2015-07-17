program main
  implicit none
  integer , parameter :: quantidade_de_rodadas = 100
  integer :: i,j,n,k,rodada
  real(kind=8), dimension(:,:), allocatable :: A,B,C
  real(kind=8) :: tempo1, tempo2, tempo_total

  call cpu_time(tempo1) !Começa a contar o tempo
  print *, "Vamos calular o tempo da rodada na CPU usando uma multiplicação de matriz qualquer gigantesca"
  print *, "É interessante comparar com o tempo do shell também: $ time ./a.out"
  
  print *, "De a dimensão n das matrizes (vamos fazer C = C0 + AxB), A e B serão unitárias e C0 zerada"
  read *,n

  allocate(A(n,n),B(n,n),C(n,n))
  !Matrizes unitárias
  A = 1.d0
  B = 1.d0

  do rodada=1,quantidade_de_rodadas
    do i=1,n
      do j=1,n
        C(i,j) = 0.d0
        !Multiplicação  de matrizes linhas X coluna
        do k=1,n
          C(i,j) = C(i,j) + A(i,k)*B(k,j)
        enddo
      enddo
    enddo
  enddo
  call cpu_time(tempo2)
  tempo_total = tempo2-tempo1
  print 11, tempo_total 
11 format("Tempo total CPU = ", f12.8, " segundos")
  
end program main

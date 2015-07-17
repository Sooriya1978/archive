program main
  implicit none
  integer , parameter :: quantidade_de_rodadas = 100
  integer :: i,j,n,k,rodada
  real(kind=8), dimension(:,:), allocatable :: A,B,C
  integer :: tempo1, tempo2, taxa
  real(kind=8) :: tempo_total

  call system_clock(tempo1) !Começa a contar o tempo
  print *, "Vamos calular o tempo da rodada fazendo uma multiplicação de matriz qualquer gigantesca"
  print *, "É interessante comparar com o tempo do shell também: $ time ./a.out"
  
  print *, "De a dimensão n das matrizes (vamos fazer C = C0 + AxB), A e B serão unitárias e C0 zerada"
  print *, "É possível compilar com a flag -O3 para melhor performance: gfortran -O3 main.f90"
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
  call system_clock(tempo2,taxa)
  tempo_total = float(tempo2-tempo1)/float(taxa)
  print 11, tempo_total 
11 format("Tempo total = ", f12.8, " segundos")
  
end program main

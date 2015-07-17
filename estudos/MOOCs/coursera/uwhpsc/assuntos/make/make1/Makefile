#This is my first makefile

output.txt: main.out
	./main.out > output.txt
#Link command:
main.out: sub1.f90 sub2.f90 main.f90
	gfortran sub1.f90 sub2.f90 main.f90 -o main.out

main.o: main.f90
	gfortran -c main.f90

sub1.o: sub1.f90
	gfortran -c sub1.f90

sub2.o: sub2.f90
	gfortran -c sub2.f90

#We can invoke in different ways: 
#make (it is implicit the target "output.txt")

#Or we can specify the targer, like: 
#make main.out
#make sub1.o

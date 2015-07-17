# Comments here
OBJECTS = circlemod.o \
          initialize.o \
          main.o

MODULES = circlemod.mod

.PHONY: clean

output.txt: main.out
	./main.out > output.txt

main.out: $(OBJECTS) $(MODULES)
	gfortran $(OBJECTS) -o main.out

%.o: %.f90
	gfortran -c $<

%.mod: %.f90
	gfortran -c $<

clean:
	rm -f $(OBJECTS) $(MODULES) main.out

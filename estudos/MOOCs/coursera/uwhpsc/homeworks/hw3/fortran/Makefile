OBJECTS = functions.o newtonmod.o test1.o
MODULES = newtonmod.mod functions.mod

FFLAGS = -g

.PHONY: test1 clean

test1: test1.out
	./test1.out

test1.out: $(MODULES) $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test1.out

%.o: %.f90
	gfortran $(FFLAGS) -c $<

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f $(OBJECTS) $(MODULES) *.out	


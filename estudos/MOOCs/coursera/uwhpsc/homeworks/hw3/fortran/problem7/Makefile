OBJECTS = functions.o newtonmod.o test_quartic.o
MODULES = newtonmod.mod functions.mod

FFLAGS = -g

.PHONY: test1 clean

test: test_quartic.out
	./test_quartic.out

test_quartic.out: $(MODULES) $(OBJECTS)
	gfortran $(FFLAGS) $(OBJECTS) -o test_quartic.out

%.o: %.f90
	gfortran $(FFLAGS) -c $<

%.mod: %.f90
	gfortran $(FFLAGS) -c $<

clean:
	rm -f $(OBJECTS) $(MODULES) *.out	


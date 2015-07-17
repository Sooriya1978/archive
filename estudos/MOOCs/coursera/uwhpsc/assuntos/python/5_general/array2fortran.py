import numpy
x = numpy.linspace(10, 60, 6)

print x

print "The default"
print numpy.reshape(x,(2,3)) # The default order os 'C'
#print x.numpy.reshape((2,3)) #  do the same

print "In Fortran "
print numpy.reshape(x,(2,3),order='F') #  'F' for fortran
#print x.numpy.reshape((2,3),order='F') #  do the same

print "Matrix to 1-dimension array C "
print x.flatten() #  'F' for fortran

print "Matrix to 1-dimension array F "
print x.flatten('F') #  'F' for fortran

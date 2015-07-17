#Using a numpy module
#apt-get install python-numpy

#Importing all functions of the module in namespace
from numpy import *
print sqrt(2.)

#sqrt(2) using Newton's Method with 30 iterations
#Inicial guess 
x=666

for i in range(30):
  print "Before %s iteration x is equal to %s" %(i,x)
  x = 0.5 * (x + (2/x))
print "The value found is: %s" %x



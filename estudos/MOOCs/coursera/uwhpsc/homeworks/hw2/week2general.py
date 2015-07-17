import numpy
from numpy.linalg import solve
import matplotlib.pyplot as p

#Given: f(x) = c0 + xc1 + x^2c2 
#data points: (-1,0); (1,4); (2,3)
#to solve: Ac=y
A = numpy.array([[1,-1,1],[1,1,1],[1,2,4]])
y = numpy.array([0,4,3])
c = solve(A,y)
print "The coefficients are: "
print c

x = numpy.linspace(-10,10,1000)
y = c[0] + c[1]*x + c[2]*(x**2)

p.figure(1)          #open plot window
p.clf()              #Clean screen
p.plot(x,y,'b--')     #blue line
p.title('Data points and interpolation polynomial')     #blue dot line
p.savefig('hw2a.png')



import newton
from numpy import linspace, pi, cos, sin, abs, where
import matplotlib.pyplot as plt

def g1vals(x):
  g1 = x*cos(pi*x)
  #g1 = sin(x)
  g1p = cos(pi*x) - x*pi*sin(pi*x)
  #g1p = cos(x)
  
  return (g1,g1p)

def g2vals(x):
  g2 = 1. - 0.6*(x**2)
  g2p = - 1.2*x
  #g2= 1. - x**2
  #g2p = -2.*x
  return (g2,g2p)

def fvals(x):
  g1,g1p = g1vals(x)
  g2,g2p = g2vals(x)
  f = g1 - g2
  fp = g1p - g2p
  return (f,fp)
 
xspace = linspace(-10,10,1000) 
g1x,g1px = g1vals(xspace)
g2x,g2px = g2vals(xspace)

#plot curves
plt.figure(1)
plt.clf()
plt.plot(xspace,g1x,'b')
plt.plot(xspace,g2x,'r')
plt.legend(['g1','g2'])

plt.figure(2)
plt.clf()
fx,fpx = fvals(xspace)
plt.plot(xspace,fx,'b')
plt.savefig('g2minusg1.png')

#plotting root points
plt.figure(1)
for x0 in [-2.2,-1.6,-0.8,1.45]:
  (x,i) = newton.solve(fvals,x0)
  print "\n Initial Guess: %22.15e" % x0
  print "   solve returned x = %22.15e after %i iterations "  % (x,i)
  g1xx,g1pxx = g1vals(x) # we could use g2 too
  fxx,fpxx = fvals(x)
  print " f(x) = %22.15e " %fxx
  plt.plot(x,g1xx,'ko')

plt.axis( (-5,5,-4,4) ) 
plt.savefig('inter.png')

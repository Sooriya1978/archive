"""
This is a newton module!
"""

def solve(fvals,x0,debug=False):
  #fvals return f(x) and fp(x)
  x = x0
  tolerance = 1.e-14 
  imax = 20

  if debug:
    print "Initial guess: ",x

  for i in range(imax):

    if debug:
      print "Iteration number: ",i, " the value of x is: ",x     
      print " "

    (f,fp) = fvals(x)
    x = x - f/fp

    if(abs(f) < tolerance):
      break

#  if debug:
#    print "Solve returns x = %22.15e after %i iterations "  % (x,i)
  return (x,i)

def fvals_sqrt(x):
  """
  functions for sqrt example
  """
  f = x**2 - 4.
  fp = 2.*x
  return (f,fp)

def test1(debug_solve=True):
  """
  Test our function solve
  """
  from numpy import sqrt
  for x0 in [1., 3., 200.,2.]:
    print " " #Blank line
    x,iterations = solve(fvals_sqrt,x0,debug=debug_solve)
    print "Solve returns x = %22.15e after %i iterations "  % (x,iterations)
    (fx,fpx) = fvals_sqrt(x)
    print "The value of f(x) is %22.15e " %fx
    assert abs(x-2.) < 1.e-14, "*** Unexpected result: x = %22.15e " % x


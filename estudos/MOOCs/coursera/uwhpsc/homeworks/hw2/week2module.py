"""
Demonstration module for learning purposes
and this is a docstring example.
Created by **thigove in coursera**
"""

import numpy
from numpy.linalg import solve
import matplotlib.pyplot as plt

def quad_interp(xi,yi):
  """
  Quadratic interpolation. Compute the coefficients of polynomial
  interpolation the points. 
  return a array c with the coefficients of:
    p(x) = c[0] + x*c[1] + (x**2)*c[2]
  """
  
  #check inputs 
  error_message = "xi and yi should have type numpy.ndarray"
  assert (type(xi) is numpy.ndarray), error_message
  assert (type(yi) is numpy.ndarray), error_message
  
  error_message = 'xi and yi  should have length 3'
  assert len(xi)==3 and len(yi)==3, error_message

  #define A in terms of xi points, bacause we want Ac=B: solve(A,B)
  A = numpy.vstack([numpy.ones(3),xi,xi**2]).T
  B = yi
  c = solve(A,B)
  print "The coefficients are: "
  print c
  return c

def plot_quad(xi,yi):
  """
  Generate plot
  """
  x = numpy.linspace(xi.min() - 5 ,xi.max() + 5 , 2000)
  c = quad_interp(xi,yi)
  y = c[0] + x*c[1] + (x**2)*c[2]
  #generate figure
  plt.figure(1)
  plt.clf()
  plt.plot(x,y,'b-')
  #adding points
  plt.plot(xi,yi,'ro')
  plt.ylim(yi.min() - 5 ,yi.max() + 5)
  plt.title("Data points and interpolation polynomial")
  plt.savefig('quad.png')

def test_quad1():
  """
    test code, no return nothing if test runs properly
    We can use python-nose
    nosetests -v hw2module.py 
  """
  xi = numpy.array([-1.,  0.,  2.])
  yi = numpy.array([ 1., -1.,  7.])
  c = quad_interp(xi,yi)
  c_true = numpy.array([-1.,0.,2.])
  print "c found = ", c
  print "c true = ", c_true
  #test tha all elements have small error
  assert numpy.allclose(c,c_true), \
    "Incorrect result, c found = %s, expexted = %s" % (c,c_true)

def cubic_interp(xi,yi):
  """
  Cubic interpolation. Compute the coefficients of polynomial
  interpolation the points. 
  return a array c with the coefficients of:
    p(x) = c[0] + x*c[1] + (x**2)*c[2] + (x**3)(c[3]
  """
  
  #check inputs 
  error_message = "xi and yi should have type numpy.ndarray"
  assert (type(xi) is numpy.ndarray), error_message
  assert (type(yi) is numpy.ndarray), error_message
  
  error_message = 'xi and yi  should have length 4'
  assert len(xi)==4 and len(yi)==4, error_message

  #define A in terms of xi points, bacause we want Ac=B: solve(A,B)
  A = numpy.vstack([numpy.ones(4),xi,xi**2,xi**3]).T
  B = yi
  c = solve(A,B)
  print "The coefficients are: "
  print c
  return c

def plot_cubic(xi,yi):
  """
  Generate plot
  """
  x = numpy.linspace(xi.min() - 5 ,xi.max() + 5 , 2000)
  c = cubic_interp(xi,yi)
  y = c[0] + x*c[1] + (x**2)*c[2] + (x**3)*c[3]
  #generate figure
  plt.figure(1)
  plt.clf()
  plt.plot(x,y,'b-')
  #adding points
  plt.plot(xi,yi,'ro')
  plt.ylim(yi.min() - 5 ,yi.max() + 5)
  plt.title("Data points and interpolation polynomial")
  plt.savefig('cubic.png')

def test_cubic1():
  """
    test code, no return nothing if test runs properly
    We can use python-nose
    nosetests -v hw2module.py 
  """
  xi = numpy.array([-1.,  0.,  2., 3.])
  yi = numpy.array([ 1., 2.,  3., 0.])
  c = cubic_interp(xi,yi)
  c_true = numpy.array([2.,1.33333333,0.08333333, -0.25 ])
  print "c found = ", c
  print "c true = ", c_true
  #test tha all elements have small error
  assert numpy.allclose(c,c_true), \
    "Incorrect result, c found = %s, expexted = %s" % (c,c_true)

def poly_interp(xi,yi):
  """
  interpotation of n
  """
  #checking inputs
  error_message = "xi and yi should have type numpy.ndarray"
  assert (type(xi) is numpy.ndarray), error_message
  assert (type(yi) is numpy.ndarray), error_message

  error_message = 'xi and yi  should have same length'
  assert len(xi)==len(yi), error_message

  size = len(xi)
  
  #define A in terms of xi points, bacause we want Ac=B: solve(A,B)
  A = numpy.vstack([xi**j for j in range(size)]).T
  B = yi
  c = solve(A,B)
  print "The coefficients are: "
  print c
  return c

def plot_poly(xi,yi):
  """
  Generate plot
  """
  c = poly_interp(xi,yi)
  x = numpy.linspace(xi.min() - 5 ,xi.max() + 5 , 2000)
  #Honer Rule
  n = len(c)
  y = c[n-1]
  for j in range(n-1, 0, -1):
    y = y*x + c[j-1]
    print y
  #generate figure
  plt.figure(1)
  plt.clf()
  plt.plot(x,y,'b-')
  #adding points
  plt.plot(xi,yi,'ro')
  plt.ylim(yi.min() - 5 ,yi.max() + 5)
  plt.title("Data points and interpolation polynomial")
  plt.savefig('poly.png')

def test_poly1():
  xi = numpy.array([-1.,  0.,  2., 3.])
  yi = numpy.array([ 1., 2.,  3., 0.])
  c = poly_interp(xi,yi)
  c_true = numpy.array([2.,1.33333333,0.08333333, -0.25 ])
  print "c found = ", c
  print "c true = ", c_true
  #test tha all elements have small error
  assert numpy.allclose(c,c_true), \
    "Incorrect result, c found = %s, expexted = %s" % (c,c_true)

def test_poly2():
    """
    Test code, no return value or exception if test runs properly.
    Same points as test_cubic1.
    """
    # Generate a test by specifying c_true first:
    c_true = numpy.array([7., -2., -3., 1.])
    # Points to interpolate:
    xi = numpy.array([-1.,  0.,  1., 2.])
    # Function values to interpolate:
    # Use Horner's rule:
    n = len(xi)
    yi = c_true[n-1]
    for j in range(n-1, 0, -1):
        yi = yi*xi + c_true[j-1]

    # Now interpolate and check we get c_true back again.
    c = poly_interp(xi,yi)
    print "xi ",xi
    print "yi ",yi
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert numpy.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

    # Also produce plot:
    plot_poly(xi,yi)
    

def test_poly3():
    """
    Test code, no return value or exception if test runs properly.
    Test with 5 points (quartic interpolating function).
    """
    # Generate a test by specifying c_true first:
    c_true = numpy.array([0., -6., 11., -6., 1.])
    # Points to interpolate:
    xi = numpy.array([-1.,  0.,  1., 2., 4.])
    # Function values to interpolate:
    # Use Horner's rule:
    n = len(xi)
    yi = c_true[n-1]
    for j in range(n-1, 0, -1):
        yi = yi*xi + c_true[j-1]

    # Now interpolate and check we get c_true back again.
    c = poly_interp(xi,yi)

    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert numpy.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

    # Also produce plot:
    plot_poly(xi,yi)


if __name__=="__main__":
  #This piece only is executed when we call this file as script
  #python hw2module.py
  print "Running test..."
  #test_quad1()
  #test_cubic1()
  test_poly1()


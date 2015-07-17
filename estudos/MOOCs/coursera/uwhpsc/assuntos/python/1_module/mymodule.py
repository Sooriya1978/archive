"""
  This module implements newton method to solve sqrt.
  by UWHPSC and Thiago
"""
def mysqrt(A):
  """
    This function is good
  """
  x = 1. #Inicial guess
  tolerance = 1.0e-14
  maximo = 100
  for i in range(maximo):
    print "Iteration number %s, the value is %10.10f" % (i,x)
    x_before = x
    x = 0.5 * (x + A/x)
    delta = x_before - x
    if abs(delta/A) < tolerance:
      break
  print "The value for sqrt of %s found was %10.10f" % (A,x)

#Config Python to read load module from my directory
#import sys
#sys.path #show current modules directories 
#sys.path.append('/home/myfolder')


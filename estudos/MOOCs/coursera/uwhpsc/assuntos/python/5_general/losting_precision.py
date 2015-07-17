#"Catastrophic cancellation
from numpy import pi
print "Pi vale",pi

y = pi*1.e-10
print "1.e-10pi + 1: ", y + 1.

z = y + 1.
print "Olha:  ", z - 1.



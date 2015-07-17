import matplotlib.pyplot as plt
import numpy

x = numpy.linspace(0.,5*numpy.pi,100) # return a numpy array 
y = numpy.cos(x)
plt.plot(x,y,'r--')
plt.title('My first plot')
plt.show()


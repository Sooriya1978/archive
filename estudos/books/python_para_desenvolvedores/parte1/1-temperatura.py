def c2f(tc):
    """
    Converte Celsius para Fahrenheit
    """
    tf = (9./5.) * tc + 32. 
    return tf

print '100 graus celsius %f fahrenheit.' % c2f(100)

def f2c(tf):
    """
    Converte Fahrenheit para Celsius
    """
    tc = (tf - 32.)*(5./9.)
    return tf

print '212 fahrenheit vale %f celsius.' % f2c(212)

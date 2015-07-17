import pdb

x=3
y=5
def f(dummy):
  x = dummy + 4
  pdb.set_trace()
  return x

y = f(x)


from z3 import *;

x = Int('x')
y = Int('y')
k = Int('k')


s = Solver()
s.add(x / (x + y) == x*k/(x*k + k))
s.add(k >= 0)

res = s.check()
m = s.model()

print res
print m
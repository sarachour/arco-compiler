#!/usr/bin/python

from sympy import *
import sympy
import sys

x = Symbol("x")
y = Symbol("y")
z = Symbol("z")
t = Symbol("t")

a = Wild("a")
b = Wild("b", exclude=[x])
c = Wild("c")
n = Wild("n")

e1 = Eq(Derivative(z,t,1),x**2/(x**2+1))
e2 = Eq(Derivative(c,t,1),(a/b)**n/((a/b)**n + 1))
e3 = (x**2/(x**2+x**2))

print apply(e3.doit, [])

res = e1.match(e2)
print type(res)
print res
for k in res:
   print k
print res[a]

e1 = x

e2 = (a/b)**n

res = e1.match(e2)

print res

print e1.match
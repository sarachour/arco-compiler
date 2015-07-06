#!/usr/bin/python

from sympy import *
import sympy
import sys

x = Symbol("x")
y = Symbol("y")
a = Wild("a")
b = Wild("b", exclude=[x])
n = Wild("n")

e1 = x**2/(x**2+1)
e2 = (a/b)**n/((a/b)**n + 1) 
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
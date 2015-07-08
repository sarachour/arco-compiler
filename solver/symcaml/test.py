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
k = Wild("k")
n = Wild("n")

e3 = (x**2/(x**2+x**2))

print "-- simpl --"
print apply(e3.doit, [])

print "-- match 1 --"
e1 = Eq(Derivative(z,t,1),x**2/(x**2+1))
e2 = Eq(Derivative(c,t,1),(a/b)**n/((a/b)**n + 1))
res = e1.match(e2)
print res

print "-- match 2 --"
e1 = Eq(Derivative(z,t,1),x+y)
e2 = Eq(c,k*a*b)
res = e1.match(e2)
print res

print "-- match 3 --"
e1 = x
e2 = (a/b)**n
res = e1.match(e2)
print res

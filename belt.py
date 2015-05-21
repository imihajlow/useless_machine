#!/usr/local/bin/python3
from sympy.solvers import solve
from sympy import Symbol
import sympy
from scipy.optimize import fsolve
import numpy

if __name__ == '__main__':
	l = Symbol('l')
	r = Symbol('r')
	R = Symbol('R')
	t = Symbol("t")
	d = Symbol('d')



	ll = solve(r / R - t / (t + l), t)[0] 

	xx = sympy.sqrt(ll ** 2 - r ** 2)
	x = sympy.sqrt((l + ll) ** 2 - R ** 2) - xx
	alpha = sympy.asin(r / ll)
	c1 = r * (sympy.pi/2 - alpha)
	c2 = R * (sympy.pi/2 + alpha)
	fd = sympy.simplify(2 * (x + c1 + c2))
	#print(fd.subs([(l, (R-r)*sympy.sqrt(2))]).subs([(r, 1), (R, 10)]))

	values = [(r, 2), (R, 18), (d, 130)]
	f = sympy.lambdify(l, (fd-d).subs(values))
	print([(x, f(x)) for x in numpy.arange(22, 35, 1)])
	print(fsolve(f, 22))

	#print(solve(fd - d, R, warn=True))


using JuMP
using Ipopt


print("starting...\n")
eps=1e-16
m = Model(solver=IpoptSolver(tol=eps,acceptable_tol=eps,
   check_derivatives_for_naninf="yes",
   expect_infeasible_problem="yes"))

@variable(m, x0, start = 0.0)
@variable(m, x1, start = 1.0)
@variable(m, x2, start = 1.0)
@variable(m, x4, start = 0.0)
@variable(m, x5, start = 0.0)

vmin = -10000
vmax = 10000
@constraint(m, vmin <= x0 <= vmax)
@constraint(m, vmin <= x1 <= vmax)
@constraint(m, vmin <= x2 <= vmax)
@constraint(m, vmin <= x4 <= vmax)
@constraint(m, vmin <= x5 <= vmax)

@constraint(m, 0 <= x1*0 + x0 <= 12000)
@constraint(m, 0 <= x1*0 + x4 <= 12000)
@constraint(m, 0 <= x1*1.32468e-6 + x4 <= 12000)
@constraint(m, 0 <= x1*0 + x0 <= 3300)
@constraint(m, 0 <= x1*0 + x0 <= 12000)
@constraint(m, 0 <= x1*0.0014 + x0 <= 12000)
@constraint(m, 0 <= x2*0.2525 + x5 <= 10)

cstr_eps = eps 
@NLconstraint(m, -cstr_eps <= x0  <= cstr_eps)
@NLconstraint(m, x4 - x0*(x5 + x2*0.2525)  - x0 == cstr_eps)
@NLconstraint(m,x4 - x0*(x5 + x2*0.2525)  -  0.0 == cstr_eps)
@NLconstraint(m,x1*(x2+x5*3.960396) - x1 == cstr_eps)

#@NLconstraint(m,cstr_eps <= x4 - x0*(x5 + x2*0.2525)  - x0 <= cstr_eps)
#@NLconstraint(m,cstr_eps <= x4 - x0*(x5 + x2*0.2525)  -  0.0 <= cstr_eps)
#@NLconstraint(m,cstr_eps <= x1*(x2+x5*3.960396) - x1 <= cstr_eps)

#@NLconstraint(m,x0 - 0.0 <= eps)
#@NLconstraint(m,x4 - x0*(x5 + x2*0.2525)  - x0 <= eps)
#@NLconstraint(m,x4 - x0*(x5 + x2*0.2525)  -  0.0 <= eps)
#@NLconstraint(m,x1*(x2+x5*3.960396) - x1 <= eps)

zero=eps^2
@NLconstraint(m,x1^2 >= zero)
@NLconstraint(m,(x2*0.2525+x5)^2 >= zero)
@NLconstraint(m,(x1*(x2+x5*3960396))^2 >= zero)


#@NLobjective(m, Max, x1+x2+x0+x4+x5)

setvalue(x0, 0.0)
setvalue(x1, 1.0)
setvalue(x2, 1.0)
setvalue(x4, 0.0)
setvalue(x5, 0.0)

print("solving...\n")

solve(m)

Profile.print()
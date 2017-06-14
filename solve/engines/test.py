from sympy_engine import engine
engine.templ.define_variable("x8")
engine.templ.define_variable("x7")
# Stot
engine.templ.define_variable("x6")
# kf
engine.templ.define_variable("x5")
# ETot
engine.templ.define_variable("x4")
# E
engine.templ.define_variable("x3")
engine.templ.add_eqn("x3","(x4-x2)")
engine.templ.define_variable("x2")
# Initial Cond
engine.templ.define_variable("x1")
engine.templ.add_diff_eqn("x2","((x5*x3*x0)-(x8*x2))")
engine.templ.add_ic("x2","x1")
engine.templ.define_variable("x0")
engine.templ.add_eqn("x0","(x6-x2)")
engine.templ.prioritize("x2")
engine.targ.define_variable("v2")
# X
engine.targ.define_variable("v1")
engine.targ.add_eqn("v1","(pv2-v2)")
# Y
engine.targ.define_variable("v0")
engine.targ.add_eqn("v0","(pv3-v2)")
engine.targ.define_variable("v2")
engine.targ.add_diff_eqn("v2","((pv1*v0*v1)-(pv4*v2))")
# initial condition
engine.targ.add_ic("v2","0")
engine.targ.define_param("pv4",[0.01])
engine.targ.define_param("pv3",[6800])
engine.targ.define_param("pv2",[4400])
engine.targ.define_param("pv1",[0.0001])
engine.targ.define_param("pv0",[0.01])
engine.targ.prioritize("v2")
engine.set_restrict_branches(100)
engine.set_restrict_size(3)
engine.solve()
engine.write("unify_0.out")

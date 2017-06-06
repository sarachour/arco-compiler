from sympy_engine import engine
engine.templ.define_variable("x8")
engine.templ.define_variable("x7")
engine.templ.define_variable("x6")
engine.templ.define_variable("x5")
engine.templ.define_variable("x4")
engine.templ.define_variable("x3")
engine.templ.add_eqn("x3","(x4-x2)")
engine.templ.define_variable("x2")
engine.templ.define_variable("x1")
engine.templ.add_diff_eqn("x2","((x5*x3*x0)-(x8*x2))")
engine.templ.add_ic("x2","x1")
engine.templ.define_variable("x0")
engine.templ.add_eqn("x0","(x6-x2)")
engine.templ.prioritize("x2")
engine.targ.define_variable("v2")
engine.targ.define_variable("v1")
engine.targ.add_eqn("v1","(pv2-v2)")
engine.targ.define_variable("v0")
engine.targ.add_eqn("v0","(pv3-v2)")
engine.targ.define_variable("v2")
engine.targ.add_diff_eqn("v2","((pv1*v0*v1)-(pv4*v2))")
engine.targ.add_ic("v2","0")
engine.targ.define_param("pv4",[1])
engine.targ.define_param("pv3",[0.15])
engine.targ.define_param("pv2",[0.11])
engine.targ.define_param("pv1",[1])
engine.targ.define_param("pv0",[0.01])

#engine.templ.add_assigns({"x3":"v1","x0":"v0"});
engine.targ.prioritize("v2")
engine.set_restrict_n(4)
engine.set_restrict_size(1)
engine.solve()
engine.write("unify_0.out")

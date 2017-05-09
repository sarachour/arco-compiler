#from sympy_engine import engine
from mathematica_engine import engine
import sys

engine.targ.define_variable("A");
engine.targ.define_variable("B");
engine.targ.define_variable("W");
engine.targ.define_variable("S");
engine.targ.define_variable("ES");
engine.targ.add_eqn("W","0.245 - ES")
engine.targ.add_eqn("S","0.311 - ES")
engine.targ.add_diff_eqn("ES","W*S - A*B*ES")
engine.targ.add_ic("ES","0.14")

engine.templ.define_variable("Xtot");
engine.templ.define_variable("Ytot");
engine.templ.define_variable("X");
engine.templ.define_variable("Y");
engine.templ.define_variable("Z");
engine.templ.define_variable("F");
engine.templ.define_variable("R");
engine.templ.define_variable("Z0");

engine.templ.add_eqn("X","Xtot - Z");
engine.templ.add_eqn("Y","Ytot - Z");
engine.templ.add_diff_eqn("Z","F*X*Y - R*Z");
engine.templ.add_ic("Z","Z0");

engine.solve();
engine.clear();
engine.write("out.txt");

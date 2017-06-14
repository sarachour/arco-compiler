
class PartialConfigSOEQ:
        def __init__(self,cfg=None):
            if cfg == None:
                self.params = {};
                self.inits = {};
                self.restricts = {};
                self.assigns = {};
            else:
                self.params = dict(cfg.params);
                self.inits = dict(cfg.inits);
                self.restricts = dict(cfg.restricts);
                self.assigns = dict(cfg.assigns);

        def restrictions(self,ns):
           excludes = {};
           for v in self.restricts:
              exprs = self.restricts[v]
              excludes[v] = map(lambda x:sympify(x,locals=ns),exprs)
           return excludes

        def get_substitution_list(self):
           return self.inits.items() + self.params.items() + self.assigns.items()


        def get_restrictions(self):
           restricts = [];
           for v in self.restricts:
             exc = self.restricts[v]
             restricts.push(v,exc)

           return restricts

        def get_substitutions(self):
           repls = {}
           for (v,e) in self.inits.items():
              repls[v] = e
           for (v,e) in self.params.items():
              repls[v] = e
           for (v,e) in self.assigns.items():
              repls[v] = e

           return repls

        def add_restrict(self,v,e):
           if not (v in self.restricts):
             self.restricts[v] = []
           self.restricts[v].append(e);

        def set_param(self,v,e):
           self.params[v] = e

        def set_init(self,v,e):
           self.inits[v] = e;

class PartialConfig:
        def __init__(self,cfg=None):
            if cfg == None:
               self.templ = PartialConfigSOEQ();
               self.targ = PartialConfigSOEQ();
            else:
               self.templ = PartialConfigSOEQ(cfg.templ)
               self.targ = PartialConfigSOEQ(cfg.targ)


        def load(self,d):
            for (k,v,expr) in list(d):
                if k == "vp":
                   self.targ.set_param(v,expr)
                elif k == "xp":
                   self.templ.set_param(v,expr)
                elif k == "v":
                   self.targ.set_init(v,expr)
                elif k == "x":
                   self.templ.set_init(v,expr)

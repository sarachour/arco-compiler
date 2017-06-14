from sympy import *

class Assignment:
        def __init__(self):
                self.assigns = {};
                self.is_real = True;

        def load_dict(self,asgns):
           for v in asgns:
              self.add(v,asgns[v])

        def add(self,v,expr):
                if sympify(expr).is_real == False:
                        self.is_real = False;

                self.assigns[v] = expr;


        def equals(self,other):
                for v in self.assigns:
                        if not (v in other.assigns):
                                return False;
                        else:
                                other_e = other.assigns[v];
                                self_e = self.assigns[v];
                                if other_e != self_e:
                                        return False;

                return True;


        def load_list(self,asgns):
                for (k,v) in asgns:
                        self.add(k,v)

        def __repr__(self):
                return "unimpl.repr"

        def __str__(self):
                assign_str= [(k+"$"+(srepr(v))) for k,v in self.assigns.iteritems()]
                strn="|".join(assign_str)
                return strn


class Assignments:
        def __init__(self):
                self.assigns = [];

        def add(self,asgn):
                if asgn.is_real == False:
                        return False;

                for c_asgn in self.assigns:
                        if c_asgn.equals(asgn):
                                return False

                self.assigns.append(asgn);
                return True;

        def __repr__(self):
                return "unimpl.repr"

        def __str__(self):
                st = "";
                for asgn in self.assigns:
                        st += asgn.__str__() + "\n"

                return st


        def _contains(self,var,expr,exclude):
                if var in exclude:
                        e = exclude[expr];
                        if expr == e:
                                return True;
                return False;

        def all_assigns(self,exclude):
           all_asgns = [];
           for asgn in self.assigns:
              all_asgns += [(k,v) for k,v in asgn.assigns.iteritems() if not self._contains(k,v,exclude)];
           return all_asgns;

        def dedup(self):
           dedup_asgns = {};
        
        def restrict(self,exclude,size,number):
                all_asgns = self.assigns();
                restricts = [];
                all_restricts= itertools.combinations(all_asgns,size);
                prob = number/(comb(len(all_asgns),size));
                sel=filter(lambda x : random.random() <= prob,all_restricts);
                return map(lambda x: list(x),sel)

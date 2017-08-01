import argparse
import subprocess
import re
import random

class TunableSMTProblem:

    def __init__(self,filename,outfile):

        self.var_to_st = {};
        self.st_to_var = {};
        self.problem = [];
        self.outfile = outfile;
        self.infile = filename

        with open(filename,'r') as f:
            tunable_line = False;
            smt_vars = []

            for line in f:
                if "@tune" in line:
                    tunable_line = True;
                    smt_var_str = line.split("@tune")[1].split(" ")
                    smt_vars = map(lambda x : x.strip(),smt_var_str);

                elif tunable_line:
                    self.st_to_var[line] = smt_vars
                    tunable_line = False
                    for v in smt_vars:
                        if not (v in self.var_to_st):
                            self.var_to_st[v] = [];

                        self.var_to_st[v].append(line)

                elif "check-sat" in line or "exit" in line:
                    tunable_line = False
                    continue;

                else:
                    self.problem.append(line);
                    tunable_line = False


    def write_model(self,data):
        model = "%s.model" % self.infile;
        with open(model,'w') as f:
            f.write(data);

    def write_result(self,data):
        with open(self.outfile,"w") as f:
            f.write(data);

    def get_tunable(self,smt_vars):
        return filter(lambda x : x in self.var_to_st, smt_vars)

    def emit(self,exclude):
        filename = "__tmp__.smt2"
        with open(filename,'w') as f:
            for line in self.problem:
                f.write(line);

            for line in self.st_to_var:
                smt_vars = self.st_to_var[line]
                intersect = filter(lambda x : x in smt_vars, exclude);
                if len(intersect) == 0:
                    f.write(line);

            f.write("(check-sat)")
            f.write("(exit)")
        return filename;

class DRealStatus:

    def _get_related(self,deps,path,smt_vars):
        direct = list(set(smt_vars))
        indirect = [];
        for smt_var in smt_vars:
            if smt_var in deps:
                indirect += filter(lambda x : not (x in path), deps[smt_var])

        return direct + indirect;
        
    def analyze_proof(self,proof):
        with open(proof,'r') as f:
            self.reason = None;
            smt_vars = []
            deps = {}
            print("===> Analyzing Proof")
            for line in f:
                if "conflict detected" in line:
                    vrb = line.split(":")[0]
                    matches = re.findall("x[0-9]+",vrb)
                    for (group) in matches:
                        smt_vars.append(group)

                if "after pruning" in line or "conflict detected" in line:
                    expr = line.split("by")[1]
                    vrb = line.split(":")[0]
                    targ_var = re.findall("x[0-9]+",vrb)[0]
                    targ_deps = re.findall("x[0-9]+",expr)
                    targ_dep_arr = [];
                    for dep in targ_deps:
                        targ_dep_arr.append(dep);

                    if targ_var in deps:
                        deps[targ_var] = deps[targ_var] + [targ_dep_arr]
                    else:
                        deps[targ_var] =[targ_dep_arr]

            if len(smt_vars) > 0:
                self.reason = self._get_related(deps,[],smt_vars)

    def analyze_log(self,log):
        smt_vars = []

        with open(log,'r') as f:
            curr_size = 0
            for line in f:
                if "ded.size = " in line:
                    dsiz = int(line.split("ded.size = ")[1])
                    if dsiz > curr_size:
                        matches = re.findall("x[0-9]+",line)
                        for (group) in matches:
                            smt_vars.append(group)

        if len(smt_vars) > 0:
            self.reason = [smt_vars]

    def __init__(self,result,proof,model,log):
        with open(result,'r') as f:
            self.status = "timeout"
            for line in f:
                if "unsat" in line:
                    self.status = "unsat"
                elif "sat" in line:
                    self.status = "sat"
                elif "unknown" in line:
                    self.status = "unknown"

        if self.status == "unsat":
            self.analyze_proof(proof)


            if self.reason == None:
                print("===> Analyzing Log")
                self.analyze_log(log)

    def is_unsat(self):
        return self.status == "unsat"

    def is_sat(self):
        return self.status == "sat"

    def has_reason(self):
        return self.reason != None

    def get_reason(self):
        if self.has_reason():
            return self.reason
        else:
            raise (Exception("cannot get a reason"))

class DRealIterativeSolver:

    def __init__(self,generator,timeout):
        self.problem = generator;
        self.timeout = timeout;

    def _init_files(self,exclude):
        self.infile = self.problem.emit(exclude);
        basename = "__tmp__"
        self.result = "%s.res" % basename
        self.log = "%s.log" % basename
        self.proof = "%s.proof" % self.infile 
        self.model = "%s.model" % self.infile

    def _execute(self,exclude):
        self._init_files(exclude);
        cmd_templ = "./timebomb.sh 'dReal --model --proof \"%s\" > \"%s\" 2> \"%s\"' %d"
        cmd = cmd_templ % (self.infile,self.result,self.log,self.timeout)
        subprocess.call(cmd,shell=True)
        status = DRealStatus(self.result,self.proof,self.model,self.log);
        return status;

    def _debug(self,exclude):
        self._init_files(exclude);
        cmd_templ = "./timebomb.sh 'dReal --model --debug --proof \"%s\" > \"%s\" 2> \"%s\"' %d"
        cmd = cmd_templ % (self.infile,self.result,self.log,self.timeout)
        subprocess.call(cmd,shell=True)
        status = DRealStatus(self.result,self.proof,self.model,self.log);
        return status;

    def copy_model(self):
        with open(self.model,'r') as f:
            data = f.read();
            self.problem.write_model(data);

    def copy_result(self):
        with open(self.result,'r') as f:
            data = f.read();
            self.problem.write_result(data);

    def execute_once(self,exclude):
        status = self._execute(exclude);
        if status.is_unsat() and status.has_reason() == False:
            status = self._debug(exclude);
            if status.has_reason() == False:
                return False,None
            else:
                return False,status.get_reason()

        elif status.is_unsat():
            return False, status.get_reason()

        elif status.is_sat():
            return True,None

        else:
            return False,None

    def choose_smt_var(self,excluded,reasons):
        variables = []
        for reason in reasons:
            tunable_vars = self.problem.get_tunable(reason)
            unchosen_vars = filter(lambda x : not (x in excluded), tunable_vars)
            variables += unchosen_vars

        return list(set(variables))

    def execute_loop(self,exclude):
        if self.is_sat:
            return;

        exclude.sort()
        key = str(exclude)
        if key in self.explored:
            return
        else:
            self.explored.append(key)

        if self.num_execs == 0:
            self.copy_result();
            return

        print("=> execute: "+key)

        sat,reason = self.execute_once(exclude)
        self.num_execs -= 1;
        if sat == False and reason == None:
            self.copy_result();

        elif sat == False:
            new_vars = self.choose_smt_var(exclude,reason)
            for new_var in new_vars:
                if self.is_sat:
                    return;
                new_exclude = exclude+[new_var]
                self.execute_loop(new_exclude)
        else:
            print("SAT!")
            self.is_sat = True;
            self.copy_result();
            self.copy_model();

    def execute(self):
        self.is_sat = False;
        self.explored = [];
        # number of executions
        self.num_execs = 100;
        self.execute_loop([])
        if self.is_sat == False:
            print("UNSAT!");

def __main__():
    parser = argparse.ArgumentParser(description='tune the tunable constraints.')
    parser.add_argument('-i','--input', help='input problem')
    parser.add_argument('-o','--output', help='output problem')
    parser.add_argument('-s','--solver', help='method')
    parser.add_argument('-t','--timeout', help="time to executed smt solver")

    args = parser.parse_args()
    problem = TunableSMTProblem(args.input,args.output);
    if args.solver == "dreal":
        solver = DRealIterativeSolver(problem,int(args.timeout))
    else:
        raise (Exception("unimpl"))
    

    solver.execute();

    print(args.input)


__main__()

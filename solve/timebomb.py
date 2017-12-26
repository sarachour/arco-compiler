import sys
from subprocess import call, Popen, PIPE
from multiprocessing import Process, Queue
import time
import shlex
queue = Queue()

def _execute(func,max_time,args):
        proc = Process(target=func,args=args);
        t0 = time.time();

        proc.start()
        while time.time() - t0 < max_time:
            proc.join(timeout=1)
            print("...")
            if not proc.is_alive():
                break;

        if proc.is_alive():
            print("-> Terminate")
            timeout = True;
            proc.terminate()
            result = None
        else:
            timeout = False;
            result = queue.get()

        return timeout,result



def _shell_exec(cmd,out=None,err=None):
    try:

            args = shlex.split(cmd)
            p = Popen([cmd],stdin=PIPE,stdout=PIPE,stderr=PIPE,shell=True)
            output,errors = p.communicate()

            if out != None:
                with open(out,'w') as f:
                        f.write(output)

            if err != None:
                with open(err,'w') as f:
                        f.write(errors)

            queue.put(p.returncode)
    except Exception as e:
            print(e)
            queue.put(1)

import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('-c','--cmd', metavar='cmd',
                    help='command to run')

parser.add_argument('-t','--timeout',dest='timeout', type=int, default=10,
                    help='amount of time to wait')
parser.add_argument('-o','--out', dest='stdout', default=None, 
                    help='where to redirect output')
parser.add_argument('-e','--err', dest='stderr', default=None, 
                    help='where to redirect error')

args = parser.parse_args()
max_time = args.timeout
cmd = args.cmd
if args.stdout != None:
        with open(args.stdout,'w') as f:
                f.write("")

if args.stderr != None:
        with open(args.stderr,'w') as f:
                f.write("")

print(cmd)
_,result = _execute(lambda :_shell_exec(cmd,out=args.stdout,err=args.stderr), max_time, [])
print("returncode:"+str(result))

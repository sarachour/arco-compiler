./sim.py --t fit -l ../sim/libs/basic/ -i vinv.comp -o log.cfg
echo "Running Experiment"
ngspice -b experiment.sim 

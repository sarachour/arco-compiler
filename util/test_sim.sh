./sim.py --t fit -l ../sim/libs/basic/ -i vinv.comp -o vinv.model-params
echo "Running Experiment"
ngspice -b experiment.sim 

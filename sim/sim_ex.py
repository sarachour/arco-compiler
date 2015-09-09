#!/usr/bin/python


import os

import matplotlib.pyplot as plt


import PySpice.Logging.Logging as SPLogging
#logger = Logging.setup_logging()


from PySpice.Probe.Plot import plot as SPPlot
from PySpice.Spice.Library import SpiceLibrary as SPLibrary
from PySpice.Spice.Netlist import Circuit as SPCircuit
from PySpice.Unit.Units import *


comp_path = os.path.join('.', 'comps')
lib_path = os.path.join('.', 'libs')
spice_library = SPLibrary(lib_path)
spice_library = SPLibrary(comp_path)

circuit = SPCircuit('Voltage Divider')
#circuit.include(spice_library['1N4148'])

inputs = ['input1', 'input2', 'res1', 'res2'];
circuit.V('input1', 'inp1', circuit.gnd, '10V')
circuit.V('input2', 'inp2', circuit.gnd, '10V')
circuit.R('res1', 'inp1', 'out', kilo(9))
circuit.R('res2', 'out', circuit.gnd, kilo(1))



print("-----Simulating-------");
simulator = circuit.simulator(temperature=25, nominal_temperature=25)
analysis = simulator.transient(step_time=0.01, end_time=200)


for k in analysis:
	print("field:"+key)

print("-----Plotting-------");

figure = plt.figure(1, (20, 10))
subfig = plt.subplot(111)

subfig.set_title('Voltage Multiplier')
subfig.set_xlabel('Time [s]')
subfig.set_ylabel('Voltage [V]')
subfig.grid()
# Fixme: axis vs axe ...

#SPPlot(analysis['out'], axis=subfig)
SPPlot(analysis['inp'], axis=subfig)
SPPlot(analysis['out'], axis=subfig)

subfig.set_ylim(0,20)

plt.tight_layout()
plt.savefig("voltages.png")

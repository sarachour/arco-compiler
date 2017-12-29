#!/usr/bin/python

import sys
import hdf5storage
import numpy as np
import matplotlib as mpl
mpl.use('Agg')
import seaborn as sns
import matplotlib.pyplot as plt

def read_series(name):
    types = {}
    print('-> reading datafile %s' % name)
    mat = hdf5storage.loadmat(name,types)

    data = mat['#subsystem#'][0][0][0]
    dynamics = {}
    for i in range(0,len(data)):
        datum = data[i]
        if len(datum) == 1 and len(datum[0]) == 1 and \
                        type(datum[0][0]) is np.unicode_:
            if datum[0][0] == 'zoh' and i >= 2:
                ident = data[i-2]
                if not (len(ident) == 1 and len(ident[0]) == 1 and
                        type(ident[0][0] is np.unicode_)):
                    continue

                ident = str(ident[0][0])
                t = map(lambda q : q[0], data[i+8])
                x = map(lambda q : q[0], data[i+17])
                assert(len(t) == len(x))
                assert(not ident in dynamics)
                dynamics[ident] = {}
                dynamics[ident]['t'] = t
                dynamics[ident]['x'] = x

            elif datum[0][0] == 'linear':
                t = map(lambda q : q[0], data[i+8])
                x = map(lambda q : q[0], data[i+17])
                ident = data[i+19][0][0]
                assert(len(t) == len(x))
                assert(not ident in dynamics)
                dynamics[ident] = {}
                dynamics[ident]['t'] = t
                dynamics[ident]['x'] = x

    return dynamics

class Series():
    def __init__(self,id,name,file,tc,data,outputs):
        self._data = data
        self._name = name
        self._file = file
        self._outputs = outputs
        self._tc = tc
        self._id = id

    def get_data(self,id):
        return self._data[id]

    def outputs(self):
        return self._outputs

    def time_constant(self):
        return self._tc

class SeriesSet():
    def __init__(self,outputs):
        self._series = {}
        self._outputs = outputs

    def add(self,id,series_name,file,tc):
        assert(not series_name in self._series)
        data = read_series(file)
        print(':> series %s' % (data.keys()))
        if len(data.keys()) == 0:
            raise Exception("Failed to extract data. Please make sure you're executing with 'auto'")
        self._series[id] = Series(id,series_name,file,tc,data,self._outputs)

    def get(self,id,outputs):
        series = self.get_series(id)
        circ_output = self._outputs.get_circuit(outputs)
        data = series.get_data(circ_output)
        tc = series.time_constant()
        sc_t = map(lambda x : float(x)/float(tc), data['t'])
        return sc_t,data['x']

    def get_series(self,id):
        return self._series[id]

    def outputs(self):
        return self._outputs

class Outputs():
    def __init__(self):
        self._outputs = {}
        self._circuit = {}

    def register(self,r,e):
        self._outputs[r] = e
        self._circuit[e] = r

    def get_output(self,circ_out):
        return self._outputs[circ_out]

    def get_circuit(self,out):
        return self._circuit[out]

    def __iter__(self):
        for v in self._outputs.values():
            yield v

class Graph():
    def __init__(self,series,id):
        self._id = id
        self._data = series
        self._title = None
        self._series = {}
        self._axis = {'x':None,'y':None}
        self._normalize = False

    def set_title(self,name):
        self._title = name

    def set_axis(self,dim,name):
        self._axis[dim] = name

    def add_series(self,id,outs=None):
        self._series[id] = {}
        if outs == None:
            outs = self._data.outputs()

        for outp in outs:
            self._series[id][outp] = {'color':None,'opacity':1}

    def set_opacity(self,series,opacity,port=None):
        if port == None:
            for p in self._series[series]:
                self.set_opacity(series,opacity,port=p)
        else:
            self._series[series][port]['opacity'] = opacity

    def set_color(self,series,color,port=None):
        if port == None:
            for p in self._series[series]:
                self.set_color(series,color,port=p)
        else:
            self._series[series][port]['color'] = color

    def normalize(self):
        self._normalize = True

    def generate(self,basename):
        filename = '%s_%d.pdf' % (basename,self._id)
        sns.set()
        print('-> generating %s' % filename)
        fig,ax = plt.subplots(nrows=1,ncols=1)

        for id in self._series:
            for outp in self._series[id]:
                meta = self._series[id][outp]
                t,x = self._data.get(id,outp)
                alpha = meta['opacity']
                if self._normalize:
                    xmax,xmin = max(x),min(x)
                    xf = map(lambda q: (q-xmin)/(xmax-xmin),x)
                else:
                    xf = x

                if meta['color'] is not None:
                    ax.plot(t,xf,alpha=alpha,color=meta['color'])
                else:
                    ax.plot(t,xf,alpha=alpha)

        fig.savefig(filename)
        plt.close(fig)

class GraphSet():

    def __init__(self):
        self._base_name = 'graph'
        self._graphs = {}
        self._outputs = Outputs()
        self._series = SeriesSet(self._outputs)

    def get_graph(self,i):
        return self._graphs[i]

    def set_base_name(self,n):
        self._base_name = n

    def add_series(self,id,series_name,file,tc):
        self._series.add(id,series_name,file,tc)

    def register_output(self,circname,outname):
        self._outputs.register(circname,outname)

    def add_graph(self,id):
        self._graphs[id] = Graph(self._series,id)

    def generate(self):
        for v in self._graphs.values():
            v.generate(self._base_name)

def read_meta(graphspec):
    gs = GraphSet()
    for line in open(graphspec):
        args = line.strip().split(',')
        cmd = args[0]
        if cmd == '':
            continue

        if cmd == 'base':
            gs.set_base_name(args[1])
        elif cmd == 'series':
            gs.add_series(int(args[1]),args[3],args[2],args[4])
        elif cmd == 'output':
            gs.register_output(args[1],args[2])
        elif cmd == 'make' and args[1] == 'graph':
            gs.add_graph(int(args[2]))
        elif cmd == 'graph':
            id = int(args[1])
            gr = gs.get_graph(id)
            subc = args[2]
            if subc == 'title':
                gr.set_title(args[3])
            elif subc == 'series':
                gr.add_series(int(args[3]))
            elif subc == 'series-opacity':
                gr.set_opacity(int(args[3]),float(args[4]))
            elif subc == 'normalize':
                gr.normalize()
            elif subc == 'series-color':
                hex = args[4]
                gr.set_color(int(args[3]),hex)
            else:
                print(args)
        else:
            print(args)

    return gs

def generate(graphspec):
    gs = read_meta(graphspec)
    gs.generate()


def main():
    generate(sys.argv[1])

if __name__ == '__main__':
    main()

from scipy import io as scipy_io
import argparse
import h5py
import numpy as np
import matplotlib.pyplot as mp 

class Series:
    def __init__(self,x,y):
        self.x = x
        self.y = y
        self.color = "black"

    def speed(self,x,tc):
        return np.multiply(tc,self.x),self.y

    def sample(self,x,tc,rate):
        return self.x,self.y

    def style(self):
        return "ko"
class Dataset:

    def __init__(self):
        self.benchmark = None
        self.data = {}
        self.series = []
        self.colors = {};
        self.outputs = []
        self.tc = None
        self.y_axis = "value" 
        self.x_axis = "time" 
        self.sample = None

    def add_output(self,f):
        colorset = ["ro","bo","ko","r^","b^","k^","r--",'b--','k--']
        self.outputs.append(f)
        self.colors[f] = colorset[len(self.colors)]

    def add_series(self,f):
        self.series.append(f)
        self.data[f] = {}

    def add_data(self,series,output,x,y):
        self.data[series][output] = Series(x,y)

    def plot(self):

        benchmark = self.benchmark
        for series in self.data:
            outputs = self.data[series]
            
            plt = mp.figure()
            mp.xlabel(self.x_axis)
            mp.ylabel(self.y_axis)
            mp.title("%s / %s" % (series,benchmark))

            for out in outputs:
                d = outputs[out]
                mp.plot(d.x,d.y,self.colors[out])

            filename = 'figs/%s-%s.pdf' % (benchmark,series)
            mp.savefig(filename)


            if "linear" in series and self.tc != None:
                plt = mp.figure()
                filename = 'figs/%s-%s-%s.pdf' % (benchmark,series,"speed")
                mp.xlabel(self.x_axis)
                mp.ylabel(self.y_axis)
                mp.title("%s / %s speed" % (series,benchmark))
                mp.savefig(filename)

            if "linear" in series and self.sample != None and self.tc != None:
                plt = mp.figure()
                filename = 'figs/%s-%s-%s.pdf' % (benchmark,series,"sample")
                mp.xlabel(self.x_axis)
                mp.ylabel(self.y_axis)
                mp.title("%s / %s sample" % (series,benchmark))
                mp.savefig(filename)

def read_header(header,dataset):
    f = open(header,'r')
    d = dataset
    for line in f:
        fields = line.split(",")
        print(fields)
        key = fields[0]
        if key == "benchmark":
            d.benchmark = fields[1].strip()

        elif key == "series":
            d.add_series(fields[1].strip())

        elif key == "output":
            d.add_output(fields[1].strip())

        elif key == "xaxis":
            d.x_axis = fields[1].strip()

        elif key == "yaxis":
            d.y_axis = fields[1].strip()
            
        elif key == "tc":
            d.tc = float(fields[1])

        elif key == "sample":
            d.sample = float(fields[1])

def read_data(data_file,dataset):
    f = h5py.File(data_file, "r")
    subsystem = f["#subsystem#"]
    print(subsystem)

    index = 0;
    time = None;

    array = []
    for mem in subsystem:
        print("=== %s === " % mem)
        for arr in subsystem[mem]:
            for el in arr:
                data = np.array(f[el])
                if len(data.shape) == 2:
                    if data.shape[1] > 30 and data.shape[1] < 1000:
                        if index % 2 == 0:
                            time = data
                            index += 1;
                        else:
                            array.append({"t":time,"x":data})
                            index += 1;

    assert(len(array) == len(dataset.series) * len(dataset.outputs))
    k = 0
    for series in dataset.series:
        for output in dataset.outputs:
            data = array[k]
            dataset.add_data(series,output,data["t"],data["x"])
            k += 1

def __main__():
    parser = argparse.ArgumentParser(description='render visualizations.')
    parser.add_argument('-i','--input', help='input problem')
    parser.add_argument('-a','--header', help='data')
    parser.add_argument('-o','--output', help='output problem')
    parser.add_argument('-t','--time-const', help='time constant')
    parser.add_argument('-s','--sampling', help='sampling rate')

    args = parser.parse_args()

    dataset = Dataset()
    read_header(args.header,dataset)
    read_data(args.input,dataset)
    dataset.plot()

    print(args.input)


__main__()

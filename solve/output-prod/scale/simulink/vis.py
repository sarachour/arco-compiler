from scipy import io as scipy_io
import argparse
import h5py
import numpy as np


def read_data(data_file,header):
    f = h5py.File(data_file, "r")
    subsystem = f["#subsystem#"]
    print(subsystem)

    index = 0;
    time = None;
    dataset = [];
    for mem in subsystem:
        print("=== %s === " % mem)
        for arr in subsystem[mem]:
            for el in arr:
                data = np.array(f[el])
                if len(data.shape) == 2:
                    if data.shape[1] > 30 and data.shape[1] < 1000:
                        print(data.shape)
                        if index % 2 == 0:
                            time = data
                            index += 1;
                        else:
                            dataset.append({"t":time,"x":data})
                            index += 1;

    print(dataset)
    print(len(dataset))

def __main__():
    parser = argparse.ArgumentParser(description='render visualizations.')
    parser.add_argument('-i','--input', help='input problem')
    parser.add_argument('-a','--header', help='data')
    parser.add_argument('-o','--output', help='output problem')
    parser.add_argument('-t','--time-const', help='time constant')
    parser.add_argument('-s','--sampling', help='sampling rate')

    args = parser.parse_args()

    read_data(args.input,args.header)


    print(args.input)


__main__()

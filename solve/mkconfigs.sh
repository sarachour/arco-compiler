#!/bin/bash

CDIR=$PWD
cd $CDIR/benchmarks/biology/configs/; ./make_configs.sh
cd $CDIR/benchmarks/protchip/configs/; ./make_configs.sh
#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
echo "Install Z3 Globally"
cd /deps/z3/repo/build
make install

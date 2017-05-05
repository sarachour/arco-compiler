#!/bin/bash

sudo apt-get install software-properties-common  python-software-properties 
sudo add-apt-repository -y ppa:dreal/dreal
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y dreal

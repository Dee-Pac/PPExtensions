#!/bin/bash -x

# Install Prerequisites

# 0. Setup Python

wget https://s3.amazonaws.com/travis-python-archives/binaries/ubuntu/14.04/x86_64/python-3.5.tar.bz2
tar xjf python-3.5.tar.bz2 --directory /
source ~/virtualenv/python3.5/bin/activate

# 1. Install Tableau SDK

wget https://downloads.tableau.com/tssoftware/Tableau-SDK-Python-Linux-64Bit-10-3-14.tar.gz
tar -xvf Tableau-SDK-Python-Linux-64Bit-10-3-14.tar.gz
cd $(ls | grep Tableau | grep -v gz)
python setup.py install

# install ppextensions

pip install ppextensions

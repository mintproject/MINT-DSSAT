#!/bin/bash

set -e

chmod 755 DSSAT-data-find
#./DSSAT-data-find
wget -nv http://workflow.isi.edu/MINT/DSSAT/ss_example_sparse.tar.gz
tar xzf ss_example_sparse.tar.gz
mv ss_example_sparse DSSAT-state

#wget -nv http://workflow.isi.edu/MINT/DSSAT/hsc.tar.gz
#tar xzf hsc.tar.gz
#mv hsc DSSAT-state

cd DSSAT-state

# run DSSAT
echo
echo
/opt/dssat/dscsm047 A MINK99RM.SNX 2>&1
#/opt/dssat/dscsm047 A ARMA0701.WHX 2>&1
echo
echo

cd ..
tar czf DSSAT-state.tar.gz DSSAT-state


#!/bin/bash

set -e

chmod 755 DSSAT-data-find
#./DSSAT-data-find
wget -nv http://workflow.isi.edu/MINT/DSSAT/ss_example_sparse.tar.gz

tar xzf ss_example_sparse.tar.gz

cd ss_example_sparse/

# run DSSAT
export PATH=/opt/dssat:$PATH
echo
echo
dssat A MINK99RM.SNX 2>&1
echo
echo

cd ..
mv ss_example_sparse DSSAT-state
tar czf DSSAT-state.tar.gz DSSAT-state


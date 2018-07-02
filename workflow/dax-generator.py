#!/usr/bin/env python

import glob
import math
import os
import re
import sys

from Pegasus.DAX3 import *

top_dir = os.getcwd()

dax = ADAG('MINT')

# email notifications
dax.invoke('all', top_dir + '/workflow/generate-graphs.sh')

inputs = []

# DSSAT-data-find binary
dssat_data_find = File('DSSAT-data-find')
dssat_data_find.addPFN(PFN('file://' + top_dir + '/DSSAT/DSSAT-data-find', 'local'))
dax.addFile(dssat_data_find)

# DSSAT
dssat = Job('DSSAT-wrapper.sh')
dssat.uses(dssat_data_find, link=Link.INPUT)
# output is a tarball of the state
dssat_state = File('DSSAT-state.tar.gz')
dssat.uses(dssat_state, link=Link.OUTPUT, transfer=True)
dax.addJob(dssat)

# Write the DAX
f = open('workflow/generated/dax.xml', 'w')
dax.writeXML(f)
f.close()


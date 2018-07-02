#!/bin/bash

cat <<EOF

cont DSSAT_Docker {
    type "docker"
    image "docker://mintproject/dssat:latest"
}

tr DSSAT-wrapper.sh {
    site condor_pool {
        type "STAGEABLE"
        container "DSSAT_Docker"
        pfn "file://$PWD/DSSAT/DSSAT-wrapper.sh"
    }
}

EOF


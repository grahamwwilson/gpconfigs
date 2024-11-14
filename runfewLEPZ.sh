#!/bin/sh

# Not sure why I started calling these bp.

#sbatch gp_launchbpLEPZC.sh 114
#sbatch gp_launchbpLEPZ.sh 113

# Run new batch of LEPZ configurations.
# These now use the TwoAngles Bhabha input files that alternate between 
# scattering angles of 31.3 mrad and 51.6 mrad 
# and allow a more definitive comparison using the identical Guinea-PIG simulation. 
sbatch gp_launchLEPZ-Bhabha-DOC.sh 115 TwoAngles
sbatch gp_launchLEPZ-Bhabha-DOC.sh 116 TwoAngles
sbatch gp_launchLEPZ-Bhabha-DOC.sh 117 TwoAngles
sbatch gp_launchLEPZ-Bhabha-DOC.sh 118 TwoAngles

exit

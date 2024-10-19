#!/bin/sh

#sbatch gp_launchbpZ.sh 70
#sbatch gp_launchbpZ.sh 71
#sbatch gp_launchbpZ.sh 72
#sbatch gp_launchbpZ.sh 73
#sbatch gp_launchbpZ.sh 74
#sbatch gp_launchbpZ.sh 75
#sbatch gp_launchbpZ.sh 76
#sbatch gp_launchbpZ.sh 77
#sbatch gp_launchbpZ.sh 78
#sbatch gp_launchbpZ.sh 79

# Outer and inner high statistics

#sbatch gp_launchbpZ.sh 91
#sbatch gp_launchbpZC.sh 92

#sbatch gp_launchbpZ.sh 93
#sbatch gp_launchbpZC.sh 94

# Now include scattering angle in Bhabha input files

sbatch gp_launchZ-Bhabha.sh 95 41
sbatch gp_launchZ-Bhabha.sh 96 67
sbatch gp_launchZ-Bhabha.sh 97 85

exit

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

sbatch gp_launchbpZC.sh 90
sbatch gp_launchbpZ.sh 89

exit

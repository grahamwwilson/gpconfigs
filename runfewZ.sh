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

#sbatch gp_launchZ-Bhabha.sh 95 41
#sbatch gp_launchZ-Bhabha.sh 96 67
#sbatch gp_launchZ-Bhabha.sh 97 85


# Vertical waist scan

#sbatch gp_launchZ-Bhabha.sh 105 31
#sbatch gp_launchZ-Bhabha.sh 106 41
#sbatch gp_launchZ-Bhabha.sh 107 52
#sbatch gp_launchZ-Bhabha.sh 108 67
#sbatch gp_launchZ-Bhabha.sh 109 85

#sbatch gp_launchZ-Bhabha.sh 110 31
#sbatch gp_launchZ-Bhabha.sh 111 41
#sbatch gp_launchZ-Bhabha.sh 112 52
#sbatch gp_launchZ-Bhabha.sh 113 67
#sbatch gp_launchZ-Bhabha.sh 114 85

#sbatch gp_launchZ-Bhabha.sh 100 31
#sbatch gp_launchZ-Bhabha.sh 101 41
#sbatch gp_launchZ-Bhabha.sh 102 52
#sbatch gp_launchZ-Bhabha.sh 103 67
#sbatch gp_launchZ-Bhabha.sh 104 85

#sbatch gp_launchZ-Bhabha.sh 115 31
#sbatch gp_launchZ-Bhabha.sh 116 41
#sbatch gp_launchZ-Bhabha.sh 117 52
#sbatch gp_launchZ-Bhabha.sh 118 67
#sbatch gp_launchZ-Bhabha.sh 119 85mrad

sbatch gp_launchZ-Bhabha.sh 120 TenAngles
sbatch gp_launchZ-Bhabha.sh 121 TenAngles

exit

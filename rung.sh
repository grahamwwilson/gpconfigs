#!/bin/sh

sbatch gp_launch.sh 2
sleep 2
sbatch gp_launch.sh 1B

exit

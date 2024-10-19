#!/bin/sh
# ./automate.sh 101 1734 -0.50
#
# Purpose. 
# 1. Update seed
# 2. Set scan value for vertical waist

NEW=$1
SEED=$2
WAIST=$3
cp accZ-97.dat accZ-${NEW}.dat
sed -i "s/1732/${SEED}/g" accZ-${NEW}.dat
sed -i "s/waist_y=1.1/waist_y=${WAIST}/g" accZ-${NEW}.dat

exit

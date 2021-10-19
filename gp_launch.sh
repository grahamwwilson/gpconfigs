#!/bin/bash
#SBATCH --job-name=gpig               # Job name
#SBATCH --partition=sixhour           # Partition Name (Required)
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=gwwilson@ku.edu   # Where to send mail	
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --mem=1gb                     # Job memory request
#SBATCH --time=0-06:00:00             # Time limit days-hrs:min:sec
#SBATCH --output=gpig_%j.log          # Standard output and error log

VERSION=$1
echo 'Version '$VERSION

pwd
hostname
date

echo "PATH: "
echo $PATH
 
echo "LD_LIBRARY_PATH"
echo $LD_LIBRARY_PATH

module list

echo "Run Guinea-Pig++ script"
 
MYWDIR=/home/gwwilson/gpruns/Run${VERSION}

MYXDIR=$WORK/GPInstall/bin

cd ${MYWDIR}

echo "Now in directory "
pwd

echo "Start execution"
date

if [[ ${VERSION} -ne 1 ]]
then
   accel=SETA_250GeV
   parms=par
   outfile=GPResults.out
else
   accel=ilc250B
   parms=gww2
   outfile=GPResults-Test17.out
fi

echo "Accelerator " ${accel}
echo "Parameters  " ${parms}
echo "Results file " ${outfile}

${MYXDIR}/guinea ${accel} ${parms} ${outfile}

#Clean up a bit
gzip lumi.*.out

# Make a copy of the input file for posterity
cp acc.dat acc-Run${VERSION}.dat
 
date

exit


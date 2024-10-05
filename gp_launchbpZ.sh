#!/bin/bash
#SBATCH --job-name=gpigb              # Job name
#SBATCH --partition=bigjay            # Partition Name (Required)
#SBATCH --mail-type=ALL               # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=gwwilson@ku.edu   # Where to send mail	
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --mem=4gb                     # Job memory request
#SBATCH --time=0-23:59:00             # Time limit days-hrs:min:sec
#SBATCH --output=gpigb_%j.log         # Standard output and error log

VERSION=$1
echo 'Version '$VERSION

echo 'Running job as '
echo 'User '$USER

pwd
hostname
date

echo 'PATH '
echo $PATH
 
echo 'LD_LIBRARY_PATH'
echo $LD_LIBRARY_PATH

module load fftw3
module list

echo 'Run Guinea-Pig++ script'

#BEAMS=$2
#echo 'Beams set to '${BEAMS}
 
MYWDIR=${WORK}/GPRuns/Run-Z-${VERSION}
echo 'Creating directory '${MYWDIR}
mkdir ${MYWDIR}
MYXDIR=$WORK/GPInstall3/bin
MYCDIR=$WORK/GPConfigFiles
MYCDIRG=${MYCDIR}/gpconfigs

echo 'Script defines'
echo 'MYWDIR:  '${MYWDIR}
echo 'MYXDIR:  '${MYXDIR}
echo 'MYCDIR:  '${MYCDIR}
echo 'MYCDIRG: '${MYCDIRG}

cd ${MYWDIR}

echo 'Now in output directory '
pwd
echo 'Making symbolic links to control file and beam files'
ln -s ${MYCDIRG}/accZ-${VERSION}.dat acc.dat
#ln -s ${MYCDIR}/electron_${BEAMS}.ini electron.ini
#ln -s ${MYCDIR}/positron_${BEAMS}.ini positron.ini
ln -s ${MYCDIR}/bhabhaZ-Probe-Copy.ini bhabha.ini

ls -lrt

echo 'Start execution'
date

accel=ILCZ
parms=lumi
outfile=GPResults.out

echo "Accelerator " ${accel}
echo "Parameters  " ${parms}
echo "Results file " ${outfile}

${MYXDIR}/guinea-Prod ${accel} ${parms} ${outfile}

# Strip off first 100,000 events from lumi.ee.out
head --lines=100000 lumi.ee.out >lumi.ee_100k.outfile

# Strip off first 200,000 events from lumi.ee.out
head --lines=200000 lumi.ee.out >lumi.ee_200k.outfile

#Clean up a bit by compressing output files
gzip *.out
#Compress *.dat files starting with b,c,h,m, or p characters like pairs.dat
gzip [bchmp]*.dat

# Make a copy of the input file for posterity
cp acc.dat acc-Run${VERSION}.dat
 
date

exit

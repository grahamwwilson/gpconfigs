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
 
MYWDIR=${WORK}/GPRuns/Run${VERSION}
echo 'Creating directory '${MYWDIR}
mkdir ${MYWDIR}
MYXDIR=$WORK/GPInstall/bin
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
ln -s ${MYCDIRG}/acc-${VERSION}.dat acc.dat
ln -s ${MYCDIR}/electron_SetA_250GeV_run1.ini electron.ini
ln -s ${MYCDIR}/positron_SetA_250GeV_run1.ini positron.ini

ls -lrt

echo 'Start execution'
date

accel=SETA_250GeV
parms=par
outfile=GPResults.out

echo "Accelerator " ${accel}
echo "Parameters  " ${parms}
echo "Results file " ${outfile}

${MYXDIR}/guinea ${accel} ${parms} ${outfile}

#Clean up a bit by compressing output files
gzip *.out

# Make a copy of the input file for posterity
cp acc.dat acc-Run${VERSION}.dat
 
date

exit

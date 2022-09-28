#!/bin/bash
# Set up a generic run

### Fixed settings
ares=08
avernum=04
amodel=NORCE_CISM08_MAR39
aexp=greenland
atempl=exp_TEMPL

# Setting parameters
if [ "$#" -ne 4 ]; then
    echo "Error: Illegal number of parameters"
    exit 2
else
    ARCM=$1
    AGCM=$2
    ASCEN=$3
    AOSENS=$4
fi

# Mapping of RCMS and GCMS
declare -A RCMnames
RCMnames=( ["MARv3.9"]="01" ["MARv3.12"]="02" ["RACMO2.3p2"]="03" )
declare -A GCMnames
GCMnames=( ["MIROC5"]="01" ["NorESM1"]="02" ["HadGEM2-ES"]="03" ["IPSL-CM5-MR"]="04" ["CSIRO-Mk3.6"]="05" ["ACCESS1.3"]="06" ["CNRM-CM6"]="07" ["UKESM1-0-LL-Robin"]="08" ["CESM2-Leo"]="09" ["CNRM-ESM2"]="10" ["MPI-ESM1-2-HR"]="11" ["CESM2-CM6"]="12" )
declare -A SCENnames
SCENnames=( ["ssp585"]="85" ["ssp245"]="45" ["ssp126"]="26" ["rcp85"]="85" ["rcp26"]="26" )
declare -A OSENSnames
OSENSnames=( ["med"]="50" ["high"]="25" ["low"]="75" ["p05"]="05" ["p95"]="95" )

##### parameters
arcmnum="${RCMnames[$ARCM]}"
agcmnum="${GCMnames[$AGCM]}"
ascenum="${SCENnames[$ASCEN]}"
aosensnum="${OSENSnames[$AOSENS]}"

## Test for empty matches
if [ -z "$arcmnum" ]; then  
      echo "Error: \$arcmnum is empty"
      exit 2
fi
if [ -z "$agcmnum" ]; then  
      echo "Error: \$agcmnum is empty"
      exit 2
fi
if [ -z "$ascenum" ]; then  
      echo "Error: \$ascenum is empty"
      exit 2
fi
if [ -z "$aosensnum" ]; then  
      echo "Error: \$aosensnum is empty"
      exit 2
fi

######################################################################

EXPNAME=${aexp}_${ares}km_v${avernum}_m${agcmnum}_r${arcmnum}_f${ascenum}_o${aosensnum}

export ARCM AGCM ASCEN AOSENS EXPNAME

echo $EXPNAME

echo RCM: $ARCM - $arcmnum 
echo GCM: $AGCM - $agcmnum  
echo Scen: $ASCEN - $ascenum 
echo Osens: $AOSENS - $aosensnum

# Move into experiment directory
if [ -d ${EXPNAME} ]; then
    cd ${EXPNAME}

    # submit
    echo submitting  
    sbatch runCISM
fi

#!/bin/bash
# Set up a generic run

### Fixed settings
ares=16
avernum=03
amodel=NORCE_CISM16_MAR39
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
GCMnames=( ["MIROC5"]="01" ["NorESM1"]="02" ["HadGEM2-ES"]="03" ["IPSL-CM5-MR"]="04" ["CSIRO-Mk3.6"]="05" ["ACCESS1.3"]="06" ["CNRM-CM6"]="07" ["UKESM1-CM6"]="08" ["CESM2"]="09" ["CNRM-ESM2"]="10" ["MPI-ESM1-2-HR"]="11" )
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

# Move into experiment directory
if [ -d ${EXPNAME} ]; then
    echo $EXPNAME
    
    echo $ARCM $AGCM $ASCEN $AOSENS 

    cd ${EXPNAME}

    # submit
    echo check 
    # get length of record
    if [ -e scalars.nc ]; then
	ll=`ncap2 -v -O -s 'print(time.size(),"%ld\n");' scalars.nc foo.nc`
	echo "ll = ${ll} "
	/bin/rm foo.nc
	
	# do something depending
	if [ "${ll}"=="140" ]; then
	    echo winner
	 #   cd ../
	 #  mv ${EXPNAME} ensemble_16km_v01/
	fi
    else
	echo "# no scalars.nc for run"
    fi
#else
#    echo "# no dir for run"
fi

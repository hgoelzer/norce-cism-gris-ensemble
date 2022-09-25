#!/bin/bash
# Set up a generic run

### Fixed settings
ares=04
avernum=04
amodel=NORCE_CISM04_MAR39
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

echo $EXPNAME

echo RCM: $ARCM - $arcmnum 
echo GCM: $AGCM - $agcmnum  
echo Scen: $ASCEN - $ascenum 
echo Osens: $AOSENS - $aosensnum

# copy template
echo creating ${EXPNAME}
if [ -d "${EXPNAME}" ]; then 
    mv ${EXPNAME} ${EXPNAME}_$(date +%Y%m%d%H%M%S)
    /bin/cp -R ${atempl} ${EXPNAME}
else
    /bin/cp -R ${atempl} ${EXPNAME}
fi

# Move into experiment directory
cd ${EXPNAME}

# modify config file
perl -p -i -e 's/ARCM/$ENV{ARCM}/g' cism.config
perl -p -i -e 's/AGCM/$ENV{AGCM}/g' cism.config
perl -p -i -e 's/ASCEN/$ENV{ASCEN}/g' cism.config
perl -p -i -e 's/AOSENS/$ENV{AOSENS}/g' cism.config
perl -p -i -e 's/EXPNAME/$ENV{EXPNAME}/g' cism.config

# modify run script
perl -p -i -e 's/EXPNAME/$ENV{EXPNAME}/g' runCISM

# link forcing files
ln -s ../../Forcing/retreatmasks_hist_med_v1_${ARCM}_${AGCM}-${ASCEN}-R${AOSENS}_${amodel}.nc ./retreatmasks.nc
ln -s ../../Forcing/smb_anomaly_proj_${ARCM}_${AGCM}-${ASCEN}_04000.nc ./smb_anomaly.nc
ln -s ../../Forcing/smb_gradz_proj_${ARCM}_${AGCM}-${ASCEN}_04000.nc ./smb_gradz.nc
ln -s ../../Forcing/artm_anomaly_proj_${ARCM}_${AGCM}-${ASCEN}_04000.nc ./artm_anomaly.nc
ln -s ../../Forcing/artm_gradz_proj_${ARCM}_${AGCM}-${ASCEN}_04000.nc ./artm_gradz.nc


#!/bin/bash
# Set up a number of runs
# parameters best derived from retreatmasks filename 

./check_run_func.sh MARv3.12 ACCESS1.3 rcp85 med
./check_run_func.sh MARv3.12 CESM2-CMIP6 ssp126 med
./check_run_func.sh MARv3.12 CESM2-CMIP6 ssp245 med
./check_run_func.sh MARv3.12 CESM2-CMIP6 ssp585 med
./check_run_func.sh MARv3.12 CESM2-Leo ssp585 med
./check_run_func.sh MARv3.12 CNRM-CM6 ssp585 med
./check_run_func.sh MARv3.12 CNRM-ESM2 ssp585 med
./check_run_func.sh MARv3.12 IPSL-CM6A-LR ssp585 med
./check_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp126 med
./check_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp245 med
./check_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp585 med
./check_run_func.sh MARv3.12 NorESM2 ssp245 med
./check_run_func.sh MARv3.12 NorESM2 ssp585 med
./check_run_func.sh MARv3.12 UKESM1-0-LL-CMIP6 ssp245 med
./check_run_func.sh MARv3.12 UKESM1-0-LL-CMIP6 ssp585 med
./check_run_func.sh MARv3.12 UKESM1-0-LL-Robin ssp585 med

./check_run_func.sh RACMO2.3p2 CESM2-Leo ssp585 med
./check_run_func.sh RACMO2.3p2 CESM2-CMIP6 ssp245 med
./check_run_func.sh RACMO2.3p2 CESM2-CMIP6 ssp126 med

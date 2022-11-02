#!/bin/bash
# Set up a number of runs
# parameters best derived from retreatmasks filename 

#./setup_run_func.sh MARv3.9 ACCESS1.3 rcp85 med
#./setup_run_func.sh MARv3.9 CESM2-Leo ssp585 med
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp126 med
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp585 med
#./setup_run_func.sh MARv3.9 CNRM-ESM2 ssp585 med
#./setup_run_func.sh MARv3.9 CSIRO-Mk3.6 rcp85 med
#./setup_run_func.sh MARv3.9 HadGEM2-ES rcp85 med
#./setup_run_func.sh MARv3.9 IPSL-CM5-MR rcp85 med
#./setup_run_func.sh MARv3.9 MIROC5 rcp26 med
#./setup_run_func.sh MARv3.9 MIROC5 rcp85 med
#./setup_run_func.sh MARv3.9 NorESM1 rcp85 med
#./setup_run_func.sh MARv3.9 UKESM1-0-LL-Robin ssp585 med
#
#./setup_run_func.sh MARv3.9 ACCESS1.3 rcp85 high
#./setup_run_func.sh MARv3.9 CESM2-Leo ssp585 high
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp126 high
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp585 high
#./setup_run_func.sh MARv3.9 CNRM-ESM2 ssp585 high
#./setup_run_func.sh MARv3.9 CSIRO-Mk3.6 rcp85 high
#./setup_run_func.sh MARv3.9 HadGEM2-ES rcp85 high
#./setup_run_func.sh MARv3.9 IPSL-CM5-MR rcp85 high
#./setup_run_func.sh MARv3.9 MIROC5 rcp26 high
#./setup_run_func.sh MARv3.9 MIROC5 rcp85 high
#./setup_run_func.sh MARv3.9 NorESM1 rcp85 high
#./setup_run_func.sh MARv3.9 UKESM1-0-LL-Robin ssp585 high
#
#./setup_run_func.sh MARv3.9 ACCESS1.3 rcp85 low
#./setup_run_func.sh MARv3.9 CESM2-Leo ssp585 low
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp126 low
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp585 low
#./setup_run_func.sh MARv3.9 CNRM-ESM2 ssp585 low
#./setup_run_func.sh MARv3.9 CSIRO-Mk3.6 rcp85 low
#./setup_run_func.sh MARv3.9 HadGEM2-ES rcp85 low
#./setup_run_func.sh MARv3.9 IPSL-CM5-MR rcp85 low
#./setup_run_func.sh MARv3.9 MIROC5 rcp26 low
#./setup_run_func.sh MARv3.9 MIROC5 rcp85 low
#./setup_run_func.sh MARv3.9 NorESM1 rcp85 low
#./setup_run_func.sh MARv3.9 UKESM1-0-LL-Robin ssp585 low
#
#
#./setup_run_func.sh MARv3.12 ACCESS1.3 rcp85 med
#./setup_run_func.sh MARv3.12 CESM2-Leo ssp585 med
#./setup_run_func.sh MARv3.12 CNRM-CM6 ssp585 med
#./setup_run_func.sh MARv3.12 CNRM-ESM2 ssp585 med
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp126 med
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp245 med
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp585 med
#./setup_run_func.sh MARv3.12 UKESM1-0-LL-Robin ssp585 med
#
#./setup_run_func.sh MARv3.12 ACCESS1.3 rcp85 high
#./setup_run_func.sh MARv3.12 CESM2-Leo ssp585 high
#./setup_run_func.sh MARv3.12 CNRM-CM6 ssp585 high
#./setup_run_func.sh MARv3.12 CNRM-ESM2 ssp585 high
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp126 high
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp245 high
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp585 high
#./setup_run_func.sh MARv3.12 UKESM1-0-LL-Robin ssp585 high
#
#./setup_run_func.sh MARv3.12 ACCESS1.3 rcp85 low
#./setup_run_func.sh MARv3.12 CESM2-Leo ssp585 low
#./setup_run_func.sh MARv3.12 CNRM-CM6 ssp585 low
#./setup_run_func.sh MARv3.12 CNRM-ESM2 ssp585 low
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp126 low
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp245 low
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp585 low
#./setup_run_func.sh MARv3.12 UKESM1-0-LL-Robin ssp585 low
#
# wide Ks
#./setup_run_func.sh MARv3.9 ACCESS1.3 rcp85 p05
#./setup_run_func.sh MARv3.9 ACCESS1.3 rcp85 p95
#./setup_run_func.sh MARv3.9 CESM2-Leo ssp585 p05
#./setup_run_func.sh MARv3.9 CESM2-Leo ssp585 p95
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp126 p05
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp126 p95
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp585 p05
#./setup_run_func.sh MARv3.9 CNRM-CM6 ssp585 p95
#./setup_run_func.sh MARv3.9 CNRM-ESM2 ssp585 p05
#./setup_run_func.sh MARv3.9 CNRM-ESM2 ssp585 p95
#./setup_run_func.sh MARv3.9 CSIRO-Mk3.6 rcp85 p05
#./setup_run_func.sh MARv3.9 CSIRO-Mk3.6 rcp85 p95
#./setup_run_func.sh MARv3.9 HadGEM2-ES rcp85 p05
#./setup_run_func.sh MARv3.9 HadGEM2-ES rcp85 p95
#./setup_run_func.sh MARv3.9 IPSL-CM5-MR rcp85 p05
#./setup_run_func.sh MARv3.9 IPSL-CM5-MR rcp85 p95
#./setup_run_func.sh MARv3.9 MIROC5 rcp26 p05
#./setup_run_func.sh MARv3.9 MIROC5 rcp26 p95
#./setup_run_func.sh MARv3.9 MIROC5 rcp85 p05
#./setup_run_func.sh MARv3.9 MIROC5 rcp85 p95
#./setup_run_func.sh MARv3.9 NorESM1 rcp85 p05
#./setup_run_func.sh MARv3.9 NorESM1 rcp85 p95
#./setup_run_func.sh MARv3.9 UKESM1-0-LL-Robin ssp585 p05
#./setup_run_func.sh MARv3.9 UKESM1-0-LL-Robin ssp585 p95
#
#
#./setup_run_func.sh MARv3.12 ACCESS1.3 rcp85 p05
#./setup_run_func.sh MARv3.12 ACCESS1.3 rcp85 p95
#./setup_run_func.sh MARv3.12 CESM2-Leo ssp585 p05
#./setup_run_func.sh MARv3.12 CESM2-Leo ssp585 p95
#./setup_run_func.sh MARv3.12 CNRM-CM6 ssp585 p05
#./setup_run_func.sh MARv3.12 CNRM-CM6 ssp585 p95
#./setup_run_func.sh MARv3.12 CNRM-ESM2 ssp585 p05
#./setup_run_func.sh MARv3.12 CNRM-ESM2 ssp585 p95
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp126 p05
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp126 p95
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp245 p05
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp245 p95
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp585 p05
#./setup_run_func.sh MARv3.12 MPI-ESM1-2-HR ssp585 p95
#./setup_run_func.sh MARv3.12 UKESM1-0-LL-Robin ssp585 p05
#./setup_run_func.sh MARv3.12 UKESM1-0-LL-Robin ssp585 p95

./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp585 med
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp245 med
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp126 med

./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp585 high
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp245 high
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp126 high

./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp585 low
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp245 low
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp126 low

./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp585 p95
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp245 p95
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp126 p95

./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp585 p05
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp245 p05
./setup_run_func.sh RACMO2.3p2 CESM2-CM6 ssp126 p05
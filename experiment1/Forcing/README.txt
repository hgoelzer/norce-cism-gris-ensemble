# Collect forcing fields

ares=08

# SMB forcing hist
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_anomaly_hist_MAR39_${ares}.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_gradz_hist_MAR39_${ares}.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/artm_anomaly_hist_MAR39_${ares}.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/artm_gradz_hist_MAR39_${ares}.nc ./

scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_anomaly_hist_MAR312_${ares}.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_gradz_hist_MAR312_${ares}.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_anomaly_hist_MAR312_${ares}.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_gradz_hist_MAR312_${ares}.nc ./


# SMB forcing proj
ln -s ../../SMB_forcing/smb_anomaly_proj_*.nc ./
ln -s ../../SMB_forcing/smb_gradz_proj_*.nc ./
ln -s ../../SMB_forcing/artm_anomaly_proj_*.nc ./
ln -s ../../SMB_forcing/artm_gradz_proj_*.nc ./


###########
# From here requires spinup/relax/make to be finished 

# inital mask
ncks -d time,-1 -v grounded_mask ../init/relax/output.nc ./grounded_mask_${ares}_MAR39.nc

# Reference elevation for retreat parameterisation 
ncks -O -d time,0 ../init/make/smb_reference_usrf.nc ./smb_reference_usrf.nc
ncrename -v usurf,smb_reference_usrf smb_reference_usrf.nc
ncks -C -O -x -v internal_time smb_reference_usrf.nc smb_reference_usrf.nc
ncap2 -O -s "time=time*0+1960" smb_reference_usrf.nc smb_reference_usrf.nc

# Reference SMB
ncks -O -d time,0 ../init/make/smb_ref.nc ./smb_ref.nc
ncrename -v smb,smb_ref smb_ref.nc
ncks -C -O -x -v internal_time smb_ref.nc smb_ref.nc
ncap2 -O -s "time=time*0+1960" smb_ref.nc smb_ref.nc


############
# From here requires retreat calculations for specific spinup
# Processed retreat forcing; based on spinup
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist-Rmed_NORCE_CISM${ares}_MAR39.nc ./
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist_med_v1_* ./


rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist-Rhigh_NORCE_CISM${ares}_MAR39.nc ./
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist_high_v1_* ./


rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist-Rlow_NORCE_CISM${ares}_MAR39.nc ./
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist_low_v1_* ./


## Workaround for CESM and UKESM
ln -s retreatmasks_hist_med_v1_MARv3.12_CESM2-ssp585-Rhigh_NORCE_CISM08_MAR39.nc retreatmasks_hist_med_v1_MARv3.12_CESM2-Leo-ssp585-Rhigh_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_CESM2-ssp585-Rlow_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.12_CESM2-Leo-ssp585-Rlow_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.12_CESM2-ssp585-Rmed_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.12_CESM2-Leo-ssp585-Rmed_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.12_CESM2-ssp585-Rp05_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.12_CESM2-Leo-ssp585-Rp05_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.12_CESM2-ssp585-Rp95_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.12_CESM2-Leo-ssp585-Rp95_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.9_CESM2-ssp585-Rhigh_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.9_CESM2-Leo-ssp585-Rhigh_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.9_CESM2-ssp585-Rlow_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.9_CESM2-Leo-ssp585-Rlow_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.9_CESM2-ssp585-Rmed_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.9_CESM2-Leo-ssp585-Rmed_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.9_CESM2-ssp585-Rp05_NORCE_CISM08_MAR39.nc	 retreatmasks_hist_med_v1_MARv3.9_CESM2-Leo-ssp585-Rp05_NORCE_CISM08_MAR39.nc	 
ln -s retreatmasks_hist_med_v1_MARv3.9_CESM2-ssp585-Rp95_NORCE_CISM08_MAR39.nc   retreatmasks_hist_med_v1_MARv3.9_CESM2-Leo-ssp585-Rp95_NORCE_CISM08_MAR39.nc   

ln -s retreatmasks_hist_med_v1_MARv3.12_UKESM1-CM6-ssp585-Rhigh_NORCE_CISM08_MAR39.nc retreatmasks_hist_med_v1_MARv3.12_UKESM1-0-LL-Robin-ssp585-Rhigh_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_UKESM1-CM6-ssp585-Rlow_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_UKESM1-0-LL-Robin-ssp585-Rlow_NORCE_CISM08_MAR39.nc  
ln -s retreatmasks_hist_med_v1_MARv3.12_UKESM1-CM6-ssp585-Rmed_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_UKESM1-0-LL-Robin-ssp585-Rmed_NORCE_CISM08_MAR39.nc  
ln -s retreatmasks_hist_med_v1_MARv3.12_UKESM1-CM6-ssp585-Rp05_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_UKESM1-0-LL-Robin-ssp585-Rp05_NORCE_CISM08_MAR39.nc  
ln -s retreatmasks_hist_med_v1_MARv3.12_UKESM1-CM6-ssp585-Rp95_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_UKESM1-0-LL-Robin-ssp585-Rp95_NORCE_CISM08_MAR39.nc  
ln -s retreatmasks_hist_med_v1_MARv3.9_UKESM1-CM6-ssp585-Rhigh_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.9_UKESM1-0-LL-Robin-ssp585-Rhigh_NORCE_CISM08_MAR39.nc  
ln -s retreatmasks_hist_med_v1_MARv3.9_UKESM1-CM6-ssp585-Rlow_NORCE_CISM08_MAR39.nc   retreatmasks_hist_med_v1_MARv3.9_UKESM1-0-LL-Robin-ssp585-Rlow_NORCE_CISM08_MAR39.nc   
ln -s retreatmasks_hist_med_v1_MARv3.9_UKESM1-CM6-ssp585-Rmed_NORCE_CISM08_MAR39.nc   retreatmasks_hist_med_v1_MARv3.9_UKESM1-0-LL-Robin-ssp585-Rmed_NORCE_CISM08_MAR39.nc   
ln -s retreatmasks_hist_med_v1_MARv3.9_UKESM1-CM6-ssp585-Rp05_NORCE_CISM08_MAR39.nc   retreatmasks_hist_med_v1_MARv3.9_UKESM1-0-LL-Robin-ssp585-Rp05_NORCE_CISM08_MAR39.nc   
ln -s retreatmasks_hist_med_v1_MARv3.9_UKESM1-CM6-ssp585-Rp95_NORCE_CISM08_MAR39.nc   retreatmasks_hist_med_v1_MARv3.9_UKESM1-0-LL-Robin-ssp585-Rp95_NORCE_CISM08_MAR39.nc   


## Workaround for MPI-ESM1-2-HR
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rhigh_NORCE_CISM08_MAR39.nc retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rhigh_NORCE_CISM08_MAR39.nc
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rlow_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rlow_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rmed_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rmed_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rp05_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rp05_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rp95_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rp95_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rhigh_NORCE_CISM08_MAR39.nc retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rhigh_NORCE_CISM08_MAR39.nc
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rlow_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rlow_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rmed_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rmed_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rp05_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rp05_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rp95_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rp95_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rhigh_NORCE_CISM08_MAR39.nc retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rhigh_NORCE_CISM08_MAR39.nc
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rlow_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rlow_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rmed_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rmed_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rp05_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rp05_NORCE_CISM08_MAR39.nc 
ln -s retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rp95_NORCE_CISM08_MAR39.nc  retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rp95_NORCE_CISM08_MAR39.nc 


## Workaround for RACMO SMB forcing
ln -s artm_anomaly_proj_RACMO2.3p2_CESM2-ssp126_08000.nc artm_anomaly_proj_RACMO2.3p2_CESM2-CM6-ssp126_08000.nc 
ln -s artm_anomaly_proj_RACMO2.3p2_CESM2-ssp245_08000.nc artm_anomaly_proj_RACMO2.3p2_CESM2-CM6-ssp245_08000.nc 
ln -s artm_anomaly_proj_RACMO2.3p2_CESM2-ssp585_08000.nc artm_anomaly_proj_RACMO2.3p2_CESM2-CM6-ssp585_08000.nc 
ln -s artm_gradz_proj_RACMO2.3p2_CESM2-ssp126_08000.nc   artm_gradz_proj_RACMO2.3p2_CESM2-CM6-ssp126_08000.nc   
ln -s artm_gradz_proj_RACMO2.3p2_CESM2-ssp245_08000.nc   artm_gradz_proj_RACMO2.3p2_CESM2-CM6-ssp245_08000.nc   
ln -s artm_gradz_proj_RACMO2.3p2_CESM2-ssp585_08000.nc   artm_gradz_proj_RACMO2.3p2_CESM2-CM6-ssp585_08000.nc   
ln -s smb_anomaly_proj_RACMO2.3p2_CESM2-ssp126_08000.nc  smb_anomaly_proj_RACMO2.3p2_CESM2-CM6-ssp126_08000.nc  
ln -s smb_anomaly_proj_RACMO2.3p2_CESM2-ssp245_08000.nc  smb_anomaly_proj_RACMO2.3p2_CESM2-CM6-ssp245_08000.nc  
ln -s smb_anomaly_proj_RACMO2.3p2_CESM2-ssp585_08000.nc  smb_anomaly_proj_RACMO2.3p2_CESM2-CM6-ssp585_08000.nc  
ln -s smb_gradz_proj_RACMO2.3p2_CESM2-ssp126_08000.nc	   smb_gradz_proj_RACMO2.3p2_CESM2-CM6-ssp126_08000.nc	   
ln -s smb_gradz_proj_RACMO2.3p2_CESM2-ssp245_08000.nc	   smb_gradz_proj_RACMO2.3p2_CESM2-CM6-ssp245_08000.nc	   
ln -s smb_gradz_proj_RACMO2.3p2_CESM2-ssp585_08000.nc    smb_gradz_proj_RACMO2.3p2_CESM2-CM6-ssp585_08000.nc    

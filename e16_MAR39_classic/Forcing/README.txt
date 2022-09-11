# Collect forcing fields

# SMB forcing hist
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_forcing_hist_MARv3.12_16.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_forcing_hist_MARv3.9_16.nc ./

# SMB forcing proj
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_forcing_histproj_MARv3.12_*16000.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_forcing_histproj_MARv3.9_*_16000.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_forcing_histproj_RACMO2.3p2_*_16000.nc ./

# Workaround for UKESM1-0-LL; rename to UKESM1-0-LL-Robin
mv smb_forcing_histproj_MARv3.12_UKESM1-0-LL-ssp585_16000.nc smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc

## make ctrl_proj forcing
cp smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc smb_forcing_histproj_ctrlproj_16000.nc
ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_forcing_histproj_ctrlproj_16000.nc smb_forcing_histproj_ctrlproj_16000.nc
ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_forcing_histproj_ctrlproj_16000.nc smb_forcing_histproj_ctrlproj_16000.nc


###########
# From here requires spinup/relax/make to be finished 

# inital mask
ncks -d time,-1 -v grounded_mask ../e16_spinup_MAR39/greenland_16km_relax/output.nc ./grounded_mask_16_MAR39.nc

# Reference elevation for retreat parameterisation 
ncks -O -d time,0 ../e16_spinup_MAR39/greenland_16km_make/smb_reference_usrf_16000m.nc ./smb_reference_usrf_16000m.nc
ncrename -v usurf,smb_reference_usrf smb_reference_usrf_16000m.nc
ncks -C -O -x -v internal_time smb_reference_usrf_16000m.nc smb_reference_usrf_16000m.nc
ncap2 -O -s "time=time*0+1960" smb_reference_usrf_16000m.nc smb_reference_usrf_16000m.nc

# Reference SMB
ncks -O -d time,0 ../e16_spinup_MAR39/greenland_16km_make/smb_ref_16000m.nc ./smb_ref_16000m.nc
ncrename -v smb,smb_ref smb_ref_16000m.nc
ncks -C -O -x -v internal_time smb_ref_16000m.nc smb_ref_16000m.nc
ncap2 -O -s "time=time*0+1960" smb_ref_16000m.nc smb_ref_16000m.nc


############
# From here requires retreat calculations for specific spinup
# Processed retreat forcing; based on spinup
cp /nird/projects/nird/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM16_MAR39/retreatmasks_hist-Rmed_NORCE_CISM16_MAR39.nc ./
cp /nird/projects/nird/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM16_MAR39/retreatmasks_hist_med_v1_* ./

# Workaround for MPIESM12HR; rename to MPI-ESM1-2-HR
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rhigh_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rhigh_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rlow_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rlow_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rmed_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rmed_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rhigh_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rhigh_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rlow_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rlow_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rmed_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rmed_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rhigh_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rhigh_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rlow_NORCE_CISM16_MAR39.nc	retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rlow_NORCE_CISM16_MAR39.nc	
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rmed_NORCE_CISM16_MAR39.nc       retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rmed_NORCE_CISM16_MAR39.nc  

mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rp05_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rp05_NORCE_CISM16_MAR39.nc
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rp05_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rp05_NORCE_CISM16_MAR39.nc
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rp05_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rp05_NORCE_CISM16_MAR39.nc
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp245-Rp95_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp245-Rp95_NORCE_CISM16_MAR39.nc
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp126-Rp95_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp126-Rp95_NORCE_CISM16_MAR39.nc
mv retreatmasks_hist_med_v1_MARv3.12_MPIESM12HR-ssp585-Rp95_NORCE_CISM16_MAR39.nc      retreatmasks_hist_med_v1_MARv3.12_MPI-ESM1-2-HR-ssp585-Rp95_NORCE_CISM16_MAR39.nc


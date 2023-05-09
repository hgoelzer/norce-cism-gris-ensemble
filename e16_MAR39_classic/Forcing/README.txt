# Collect forcing fields

# Can link in from below now
ln -s ../../SMB_forcing/*.nc ./

## SMB forcing hist
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_anomaly_hist_MARv3.12_16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_gradz_hist_MARv3.12_16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_anomaly_hist_MARv3.12_16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_gradz_hist_MARv3.12_16000.nc ./
#
## SMB forcing proj
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_anomaly_proj_MARv3.12_*16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_gradz_proj_MARv3.12_*16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_anomaly_proj_MARv3.12_*16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_gradz_proj_MARv3.12_*16000.nc ./
#
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_anomaly_proj_RACMO2.3p2_*_16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_gradz_proj_RACMO2.3p2_*_16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/artm_anomaly_proj_RACMO2.3p2_*_16000.nc ./
#scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/artm_gradz_proj_RACMO2.3p2_*_16000.nc ./
#
### make ctrl_proj forcing
#cp smb_anomaly_proj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc smb_anomaly_proj_ctrlproj_16000.nc
#ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_anomaly_proj_ctrlproj_16000.nc smb_anomaly_proj_ctrlproj_16000.nc
#cp smb_gradz_proj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc smb_gradz_proj_ctrlproj_16000.nc
#ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_gradz_proj_ctrlproj_16000.nc smb_gradz_proj_ctrlproj_16000.nc


###########
# From here requires spinup/relax/make to be finished 

# inital mask
ncks -d time,-1 -v grounded_mask ../e16_spinup_MAR312/greenland_16km_relax/output.nc ./grounded_mask_16_MAR312.nc

# Reference elevation for retreat parameterisation 
ncks -O -d time,0 ../e16_spinup_MAR312/greenland_16km_make/smb_reference_usrf_16000m.nc ./smb_reference_usrf_16000m.nc
ncrename -v usurf,smb_reference_usrf smb_reference_usrf_16000m.nc
ncks -C -O -x -v internal_time smb_reference_usrf_16000m.nc smb_reference_usrf_16000m.nc
ncap2 -O -s "time=time*0+1960" smb_reference_usrf_16000m.nc smb_reference_usrf_16000m.nc

# Reference SMB
ncks -O -d time,0 ../e16_spinup_MAR312/greenland_16km_make/smb_ref_16000m.nc ./smb_ref_16000m.nc
ncrename -v smb,smb_ref smb_ref_16000m.nc
ncks -C -O -x -v internal_time smb_ref_16000m.nc smb_ref_16000m.nc
ncap2 -O -s "time=time*0+1960" smb_ref_16000m.nc smb_ref_16000m.nc


############
# From here requires retreat calculations for specific spinup
# Processed retreat forcing; based on spinup
scp nird:/nird/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM16_MAR312/retreatmasks_hist-R*_NORCE_CISM16_MAR312.nc ./

scp nird:/nird/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM16_MAR312/retreatmasks_hist_med_v1_* ./


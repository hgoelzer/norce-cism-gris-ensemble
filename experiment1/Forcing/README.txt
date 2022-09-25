# Collect forcing fields

ares=04

# SMB forcing hist
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_anomaly_hist_MAR39_04.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_gradz_hist_MAR39_04.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/artm_anomaly_hist_MAR39_04.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/artm_gradz_hist_MAR39_04.nc ./

# SMB forcing proj
ln -s ../../SMB_forcing/smb_forcing_histproj_*.nc ./

## ctrl_proj forcing
ln -s ../../smb_forcing_histproj_ctrlproj_${ares}000.nc ./


###########
# From here requires spinup/relax/make to be finished 

# inital mask
ncks -d time,-1 -v grounded_mask ../init/relax/output.nc ./grounded_mask_${ares}_MAR312.nc

# Reference elevation for retreat parameterisation 
ncks -O -d time,0 ../init/make/smb_reference_usrf_${ares}000m.nc ./smb_reference_usrf_${ares}000m.nc
ncrename -v usurf,smb_reference_usrf smb_reference_usrf_${ares}000m.nc
ncks -C -O -x -v internal_time smb_reference_usrf_${ares}000m.nc smb_reference_usrf_${ares}000m.nc
ncap2 -O -s "time=time*0+1960" smb_reference_usrf_${ares}000m.nc smb_reference_usrf_${ares}000m.nc

# Reference SMB
ncks -O -d time,0 ../init/make/smb_ref_${ares}000m.nc ./smb_ref_${ares}000m.nc
ncrename -v smb,smb_ref smb_ref_${ares}000m.nc
ncks -C -O -x -v internal_time smb_ref_${ares}000m.nc smb_ref_${ares}000m.nc
ncap2 -O -s "time=time*0+1960" smb_ref_${ares}000m.nc smb_ref_${ares}000m.nc


############
# From here requires retreat calculations for specific spinup
# Processed retreat forcing; based on spinup
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist-Rmed_NORCE_CISM${ares}_MAR39.nc ./
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist_med_v1_* ./


rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist-Rhigh_NORCE_CISM${ares}_MAR39.nc ./
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist_high_v1_* ./


rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist-Rlow_NORCE_CISM${ares}_MAR39.nc ./
rsync -av nird:/projects/NS8085K/PROTECT/protect-gris-ocean-forcing/Models/NORCE_CISM${ares}_MAR39/retreatmasks_hist_low_v1_* ./

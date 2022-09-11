# Collect forcing fields

# SMB forcing
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_forcing_histproj_MARv3.12_*16000.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_forcing_histproj_MARv3.9_*_16000.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_forcing_histproj_RACMO2.3p2_*_16000.nc ./

# Workaround for UKESM1-0-LL; rename to UKESM1-0-LL-Robin
mv smb_forcing_histproj_MARv3.12_UKESM1-0-LL-ssp585_16000.nc smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc

## make ctrl_proj forcing
cp smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc smb_forcing_histproj_ctrlproj_16000.nc
ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_forcing_histproj_ctrlproj_16000.nc smb_forcing_histproj_ctrlproj_16000.nc
ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_forcing_histproj_ctrlproj_16000.nc smb_forcing_histproj_ctrlproj_16000.nc


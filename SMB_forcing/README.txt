# Collect forcing fields

ares=04

# SMB forcing
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_forcing_histproj_MARv3.12_*${ares}000.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_forcing_histproj_MARv3.9_*_${ares}000.nc ./
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_forcing_histproj_RACMO2.3p2_*_${ares}000.nc ./

# Workaround for UKESM1-0-LL; rename to UKESM1-0-LL-Robin
mv smb_forcing_histproj_MARv3.12_UKESM1-0-LL-ssp585_${ares}000.nc smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_${ares}000.nc

## make ctrl_proj forcing
cp smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_${ares}000.nc smb_forcing_histproj_ctrlproj_${ares}000.nc
ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_forcing_histproj_ctrlproj_${ares}000.nc smb_forcing_histproj_ctrlproj_${ares}000.nc
ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_forcing_histproj_ctrlproj_${ares}000.nc smb_forcing_histproj_ctrlproj_${ares}000.nc


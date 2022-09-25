# Collect SMB forcing fields
# These are often independent of the specific spinup/experiment. That's why they could be collected here.

ares=04

# SMB forcing
#rsync -av nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_forcing_histproj_MARv3.12_*_${ares}000.nc ./
rsync -av nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_forcing_histproj_MARv3.9_*_${ares}000.nc ./
rsync -av nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_forcing_histproj_RACMO2.3p2_*_${ares}000.nc ./


### make ctrl_proj forcing
cp smb_forcing_histproj_MARv3.12_UKESM1-0-LL-Robin-ssp585_${ares}000.nc smb_forcing_histproj_ctrlproj_${ares}000.nc
ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_forcing_histproj_ctrlproj_${ares}000.nc smb_forcing_histproj_ctrlproj_${ares}000.nc
ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_forcing_histproj_ctrlproj_${ares}000.nc smb_forcing_histproj_ctrlproj_${ares}000.nc


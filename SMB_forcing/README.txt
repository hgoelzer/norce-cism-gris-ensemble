# Collect forcing fields

# SMB forcing hist
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_anomaly_hist_MARv3.12_16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_gradz_hist_MARv3.12_16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_anomaly_hist_MARv3.12_16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_gradz_hist_MARv3.12_16000.nc ./

# SMB forcing proj
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_anomaly_proj_MARv3.12_*16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_gradz_proj_MARv3.12_*16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_anomaly_proj_MARv3.12_*16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_gradz_proj_MARv3.12_*16000.nc ./

scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_anomaly_proj_RACMO2.3p2_*_16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_gradz_proj_RACMO2.3p2_*_16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/artm_anomaly_proj_RACMO2.3p2_*_16000.nc ./
scp nird:/nird/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/artm_gradz_proj_RACMO2.3p2_*_16000.nc ./

## make ctrl_proj forcing
cp smb_anomaly_proj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc smb_anomaly_proj_ctrlproj_16000.nc
ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_anomaly_proj_ctrlproj_16000.nc smb_anomaly_proj_ctrlproj_16000.nc
cp smb_gradz_proj_MARv3.12_UKESM1-0-LL-Robin-ssp585_16000.nc smb_gradz_proj_ctrlproj_16000.nc
ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_gradz_proj_ctrlproj_16000.nc smb_gradz_proj_ctrlproj_16000.nc



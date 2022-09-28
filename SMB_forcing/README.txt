# Collect SMB forcing fields
# These are often independent of the specific spinup/experiment. That's why they could be collected here.

ares=08

# SMB forcing
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_anomaly_proj_MARv3.12_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/artm_gradz_proj_MARv3.12_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_anomaly_proj_MARv3.12_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.12/smb_gradz_proj_MARv3.12_*_${ares}000.nc ./

scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/artm_anomaly_proj_MARv3.9_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/artm_gradz_proj_MARv3.9_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_anomaly_proj_MARv3.9_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MARv3.9/smb_gradz_proj_MARv3.9_*_${ares}000.nc ./

scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/artm_anomaly_proj_RACMO2.3p2_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/artm_gradz_proj_RACMO2.3p2_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_anomaly_proj_RACMO2.3p2_*_${ares}000.nc ./
scp nird:/projects/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/RACMO2.3p2/smb_gradz_proj_RACMO2.3p2_*_${ares}000.nc ./



#### make ctrl_proj forcing
cp smb_anomaly_proj_MARv3.9_MIROC5-rcp85_${ares}000.nc smb_anomaly_proj_ctrlproj_${ares}000.nc
ncap2 -O -s 'smb_anomaly=smb_anomaly*0.0' smb_anomaly_proj_ctrlproj_${ares}000.nc smb_anomaly_proj_ctrlproj_${ares}000.nc
cp smb_gradz_proj_MARv3.9_MIROC5-rcp85_${ares}000.nc smb_gradz_proj_ctrlproj_${ares}000.nc
ncap2 -O -s 'smb_gradz=smb_gradz*0.0' smb_gradz_proj_ctrlproj_${ares}000.nc smb_gradz_proj_ctrlproj_${ares}000.nc
cp artm_anomaly_proj_MARv3.9_MIROC5-rcp85_${ares}000.nc artm_anomaly_proj_ctrlproj_${ares}000.nc
ncap2 -O -s 'artm_anomaly=artm_anomaly*0.0' artm_anomaly_proj_ctrlproj_${ares}000.nc artm_anomaly_proj_ctrlproj_${ares}000.nc
cp artm_gradz_proj_MARv3.9_MIROC5-rcp85_${ares}000.nc artm_gradz_proj_ctrlproj_${ares}000.nc
ncap2 -O -s 'artm_gradz=artm_gradz*0.0' artm_gradz_proj_ctrlproj_${ares}000.nc artm_gradz_proj_ctrlproj_${ares}000.nc



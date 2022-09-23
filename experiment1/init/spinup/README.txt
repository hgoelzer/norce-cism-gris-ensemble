# Spinning up to MAR3.9 SMB

# data produced on nird and copied from mount
cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MAR3.9/smb_ref_MARv3.9-yearly-ERA-1960-1989_16000m.nc ./

cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MAR3.9/artm_ref_MARv3.9-yearly-ERA-1960-1989_16000m.nc ./

cp /nird/projects/nird/NS8006K/CISM/GrIS/Forcing/Data/Reprojected/MAR3.9/grounded_mask_MARv3.9_16000m.nc ./

ncks -O smb_ref_MARv3.9-yearly-ERA-1960-1989_16000m.nc smb_MAR39_16000m.nc
ncks -A -v grounded_mask grounded_mask_MARv3.9_16000m.nc smb_MAR39_16000m.nc
ncap2 -O -s 'smb=smb; where(grounded_mask<1)smb=-2000' -v smb_MAR39_16000m.nc smb_masked_MAR39_16000m.nc

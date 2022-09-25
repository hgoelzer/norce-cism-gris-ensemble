# Setup hist experiment

ares=04

ln -s ../restarts/restart_relax.nc ./

ln -s ../../Forcing/smb_ref_${ares}000m.nc smb_ref.nc
ln -s ../../Forcing/smb_reference_usrf_${ares}000m.nc smb_reference_usrf.nc

ln -s ../../Forcing/smb_forcing_hist_MARv3.12_${ares}.nc smb_forcing.nc
ln -s ../../Forcing/retreatmasks_hist-Rmed_NORCE_CISM${ares}_MAR39.nc retreatmasks.nc

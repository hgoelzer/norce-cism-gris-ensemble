# Setup hist experiment

ares=16

ln -s ../restarts/restart_relax.nc ./

ln -s ../../Forcing/smb_ref.nc smb_ref.nc
ln -s ../../Forcing/smb_reference_usrf.nc smb_reference_usrf.nc

ln -s ../../Forcing/smb_anomaly_hist_MARv3.9_${ares}000.nc smb_anomaly.nc
ln -s ../../Forcing/smb_gradz_hist_MARv3.9_${ares}000.nc smb_gradz.nc
ln -s ../../Forcing/artm_anomaly_hist_MARv3.9_${ares}000.nc artm_anomaly.nc
ln -s ../../Forcing/artm_gradz_hist_MARv3.9_${ares}000.nc artm_gradz.nc

ln -s ../../Forcing/retreatmasks_hist-Rmed_NORCE_CISM${ares}_MAR39.nc retreatmasks.nc


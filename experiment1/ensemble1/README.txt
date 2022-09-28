# Scripts for automatic setup of a series of runs

# Items to be controlled by meta script:
- rcm [ARCM]: MARv3.9 | MARv3.12 | ...
- model [AGCM]: MIROC5 | NorESM1 | ...
- scenario [ASCEN]: rcp85 | rcp26 | ssp585 | ssp126 | ssp245
- ocean sens [AOSENS]: Rmed | Rhigh | Rlow

# Experiment template
exp_TEMPL


# meta script for setup
meta_setup_runs.sh
setup_run_func.sh

# submit ensemble
meta_submit_runs.sh
submit_run_func.sh

# submit ensemble
meta_check_runs.sh
check_run_func.sh

# submit ensemble
meta_clean_runs.sh
clean_run_func.sh


# setup ctrl_proj
cp -R greenland_08km_v04_m01_r01_f26_o50 greenland_08km_v04_ctrl_proj
cd greenland_08km_v04_ctrl_proj
rm -f smb_anomaly.nc smb_gradz.nc artm_anomaly.nc artm_gradz.nc
ln -s ../../Forcing/smb_anomaly_proj_ctrlproj_08000.nc smb_anomaly.nc
ln -s ../../Forcing/smb_gradz_proj_ctrlproj_08000.nc smb_gradz.nc 
ln -s ../../Forcing/artm_gradz_proj_ctrlproj_08000.nc artm_gradz.nc
ln -s ../../Forcing/artm_anomaly_proj_ctrlproj_08000.nc artm_anomaly.nc

# restarts

# relax 
ncks -d time,-1 ../../e16_spinup_MAR312/greenland_16km_relax/restart.nc ./restart_relax.nc

# hist
ncks -d time,-1 ../hist/restart.nc ./restart_hist.nc

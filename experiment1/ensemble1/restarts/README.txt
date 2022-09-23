# restarts

# relax 
ncks -d time,-1 ../../init/relax/restart.nc ./restart_relax.nc

# hist
ncks -d time,-1 ../hist/restart.nc ./restart_hist.nc

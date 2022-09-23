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

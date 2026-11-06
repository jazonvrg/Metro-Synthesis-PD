# PH_run06 MMMC: giong mmmc_typ.tcl cua run04/05, them pad_model.lib va SDC da bo current_design.
set PDK /data/loadtest-eda-design/INNOVUS/DESIGN/GPDK
set MAC /data/thithietkevmbd/home/competitor01/pd_metro_card/macro_PLACEHOLDER/v2

create_library_set -name PH_typ_libs \
    -timing [list $PDK/LIBS/GPDK045/timing/typical.lib $MAC/sram_placeholder_typical.lib [file join [pwd] pad_model.lib]]

create_opcond -name PH_typ_opcond -process 1.0 -voltage 1.2 -temperature 25.0

create_timing_condition -name PH_typ_tc \
    -opcond PH_typ_opcond \
    -library_sets { PH_typ_libs }

create_rc_corner -name PH_typ_rc \
    -temperature 25.0 \
    -qrc_tech $PDK/TECH/qrcTechFile \
    -cap_table $PDK/TECH/capTable

create_delay_corner -name PH_typ_dc \
    -early_timing_condition { PH_typ_tc } \
    -late_timing_condition { PH_typ_tc } \
    -early_rc_corner PH_typ_rc \
    -late_rc_corner PH_typ_rc

create_constraint_mode -name PH_func \
    -sdc_files [list [file join [pwd] pad_func.sdc]]

create_analysis_view -name PH_typ_view \
    -constraint_mode PH_func \
    -delay_corner PH_typ_dc

set_analysis_view -setup { PH_typ_view } -hold { PH_typ_view }

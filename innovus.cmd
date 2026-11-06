#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Nov  6 13:17:59 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v25.12-s079_1 (64bit) 11/18/2025 12:56 (Linux 4.18.0-305.el8.x86_64)
#@(#)CDS: NanoRoute 25.12-s079_1 NR251112-0044/25_12-UB (database version 18.20.680) {superthreading v2.20}
#@(#)CDS: AAE 25.12-s028 (64bit) 11/18/2025 (Linux 4.18.0-305.el8.x86_64)
#@(#)CDS: CTE 25.12-s024_1 () Nov 12 2025 02:41:04 ( )
#@(#)CDS: SYNTECH 25.12-s006_1 () Oct 30 2025 11:18:17 ( )
#@(#)CDS: CPE v25.12-s020
#@(#)CDS: IQuantus/TQuantus 24.1.0-s365 (64bit) Mon Oct 13 00:44:28 PDT 2025 (Linux 4.18.0-305.el8.x86_64)

gui_select -point {0.05700 0.08300}
#@ source import.tcl 
#@ Begin verbose source (pre): source import.tcl 
set PDK /data/loadtest-eda-design/INNOVUS/DESIGN/GPDK
set SNAP /data/thithietkevmbd/home/competitor01/pd_metro_card/handoff/snap_20261104_1117_rtle257a4e0
set MAC /data/thithietkevmbd/home/competitor01/pd_metro_card/macro_PLACEHOLDER/v2
set fin [open $SNAP/outputs/innovus_metro_card_top.default_emulate_constraint_mode.sdc r]
set sdc_txt [read $fin]
close $fin
set fout [open pad_func.sdc w]
foreach line [split $sdc_txt "\n"] {
    if {[regexp {^\s*current_design\s} $line]} { continue }
    puts $fout $line
}
close $fout
set_db design_process_node 45
read_mmmc [file join [pwd] mmmc_pad.tcl]
#@ Begin verbose source /data/thithietkevmbd/home/competitor01/pd_metro_card/runs/PH_run06_padring/mmmc_pad.tcl (pre)
set PDK /data/loadtest-eda-design/INNOVUS/DESIGN/GPDK
set MAC /data/thithietkevmbd/home/competitor01/pd_metro_card/macro_PLACEHOLDER/v2
create_library_set -name PH_typ_libs \
    -timing [list $PDK/LIBS/GPDK045/timing/typical.lib $MAC/sram_placeholder_typical.lib [file join [pwd] pad_model.lib]]
#@ End verbose source /data/thithietkevmbd/home/competitor01/pd_metro_card/runs/PH_run06_padring/mmmc_pad.tcl
#@ End verbose source import.tcl
#@ source floorplan.tcl 
#@ Begin verbose source (pre): source floorplan.tcl 
create_floorplan -site CoreSite -core_size {240 205.2 40 40 40 40}
#@ End verbose source floorplan.tcl
#@ source import.tcl 
#@ Begin verbose source (pre): source import.tcl 
set PDK /data/loadtest-eda-design/INNOVUS/DESIGN/GPDK
set SNAP /data/thithietkevmbd/home/competitor01/pd_metro_card/handoff/snap_20261104_1117_rtle257a4e0
set MAC /data/thithietkevmbd/home/competitor01/pd_metro_card/macro_PLACEHOLDER/v2
set fin [open $SNAP/outputs/innovus_metro_card_top.default_emulate_constraint_mode.sdc r]
set sdc_txt [read $fin]
close $fin
set fout [open pad_func.sdc w]
foreach line [split $sdc_txt "\n"] {
    if {[regexp {^\s*current_design\s} $line]} { continue }
    puts $fout $line
}
close $fout
set_db design_process_node 45
read_mmmc [file join [pwd] mmmc_pad.tcl]
#@ Begin verbose source /data/thithietkevmbd/home/competitor01/pd_metro_card/runs/PH_run06_padring/mmmc_pad.tcl (pre)
set PDK /data/loadtest-eda-design/INNOVUS/DESIGN/GPDK
set MAC /data/thithietkevmbd/home/competitor01/pd_metro_card/macro_PLACEHOLDER/v2
create_library_set -name PH_typ_libs \
    -timing [list $PDK/LIBS/GPDK045/timing/typical.lib $MAC/sram_placeholder_typical.lib [file join [pwd] pad_model.lib]]
#@ End verbose source /data/thithietkevmbd/home/competitor01/pd_metro_card/runs/PH_run06_padring/mmmc_pad.tcl
#@ End verbose source import.tcl
exit

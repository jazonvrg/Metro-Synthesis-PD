# PH_run06: import co pad. Top moi = metro_card_pad_top (wrapper), core = metro_card_top.
# Can co san trong thu muc run: pad_model.lef, pad_model.lib, metro_card_pad_top.v (chay gen_pad_files.py truoc).
set PDK /data/loadtest-eda-design/INNOVUS/DESIGN/GPDK
set SNAP /data/thithietkevmbd/home/competitor01/pd_metro_card/handoff/snap_20261104_1117_rtle257a4e0
set MAC /data/thithietkevmbd/home/competitor01/pd_metro_card/macro_PLACEHOLDER/v2

# SDC goc co dong "current_design metro_card_top" (se tro vao module con) -> loai bo dong do.
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
read_physical -lef [list $PDK/LIBS/GPDK045/gsclib045.lef $MAC/sram_placeholder.lef [file join [pwd] pad_model.lef]]
read_netlist [list $SNAP/outputs/innovus_metro_card_top.v [file join [pwd] metro_card_pad_top.v]] -top metro_card_pad_top

set_db init_power_nets VDD
set_db init_ground_nets VSS
init_design

puts "insts : [llength [get_db insts]]"
puts "ports : [llength [get_db ports]]"
puts "sram  : [get_db insts *sram_dut*]"
puts "pads  : [llength [get_db insts pad_*]]  (mong doi 78)"

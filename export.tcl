# PH_run04: export. Run after 09_filler.
extract_rc
write_parasitics -spef_file results/metro_card_top_final.spef -view PH_typ_view
write_netlist results/metro_card_top_final.v
write_netlist results/metro_card_top_lvs.v -phys
write_sdc results/metro_card_top_final.sdc
write_sdf results/metro_card_top_gls.sdf -gate_level_sim_model -recompute_delay_calc
report_timing > reports/timing_setup.rpt
report_timing -early > reports/timing_hold.rpt
report_area > reports/area.rpt
report_power > reports/power.rpt
report_clock_trees > reports/clock_trees.rpt

# PH_run04: post-CTS opt, tie-offs, route, post-route opt, fillers. Run after cts.tcl. Check between steps with the full check_connectivity (not -type regular).
opt_design -post_cts
add_tieoffs -lib_cell {TIEHI TIELO} -prefix pdtie
route_design -global_detail
set_db delaycal_enable_si false
opt_design -post_route -setup
set_db extract_rc_coupled true
set_db delaycal_enable_si true
add_fillers -base_cells {FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1} -prefix pdfill -fill_gap

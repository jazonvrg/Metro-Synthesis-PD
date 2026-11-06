# PH_run06: halo macro (left bottom right top, um). Ten instance co tien to core_i/ do wrapper.
# Chay sau read_db DBS/04_power, truoc place.tcl.
set sram_name [get_db [get_db insts *sram_dut*] .name]
create_place_halo -insts $sram_name -halo_deltas {3.0 6.0 3.0 6.0} -snap_to_site

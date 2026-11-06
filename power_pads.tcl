# PH_run06: TUY CHON. 4 pad nguon (2 VDD + 2 VSS) la pad chi co the vat ly, noi vao core ring.
# Chay SAU power.tcl, TRUOC write_db DBS/04_power. Neu loi, bo qua file nay (core van co nguon tu ring + stripe).
source pad_slots.tcl
set bb [join [get_db current_design .bbox]]
lassign $bb dx0 dy0 dw dh

foreach s $PAD_POWER_SLOTS {
    lassign $s side idx name cell
    lassign [pad_xy $side $idx $dw $dh] x y orient
    create_inst -cell $cell -inst $name -location [list $x $y] -orient $orient -status fixed
    puts "PH_run06 power pad $name ($cell) tai $x $y $orient"
}

connect_global_net VDD -type pg_pin -pin_base_name VDD -all -verbose
connect_global_net VSS -type pg_pin -pin_base_name VSS -all -verbose
route_special -connect {pad_pin} -nets {VDD VSS} -allow_jogging 1 -allow_layer_change 1 -layer_change_range {Metal1 Metal8}

# PH_run06: bang slot pad (sinh boi gen_pad_files.py, dung sua tay).
set PAD_W 10.0
set PAD_H 30.0
set PAD_X0 30.0
set PAD_Y0 32.0
# {side idx inst cell}  idx: top/bottom = trai->phai, left/right = duoi->tren
set PAD_SLOTS {
  {right 0 pad_PWDATA_0 PADIN}
  {right 1 pad_PRDATA_0 PADOUT}
  {right 2 pad_PWDATA_1 PADIN}
  {right 3 pad_PRDATA_1 PADOUT}
  {right 4 pad_PWDATA_2 PADIN}
  {right 5 pad_PRDATA_2 PADOUT}
  {right 6 pad_PWDATA_3 PADIN}
  {right 7 pad_PRDATA_3 PADOUT}
  {right 8 pad_PWDATA_4 PADIN}
  {right 9 pad_PRDATA_4 PADOUT}
  {right 10 pad_PWDATA_5 PADIN}
  {right 11 pad_PRDATA_5 PADOUT}
  {right 12 pad_PWDATA_6 PADIN}
  {right 13 pad_PRDATA_6 PADOUT}
  {right 14 pad_PWDATA_7 PADIN}
  {right 15 pad_PRDATA_7 PADOUT}
  {right 16 pad_PWDATA_8 PADIN}
  {right 17 pad_PRDATA_8 PADOUT}
  {right 18 pad_PWDATA_9 PADIN}
  {right 19 pad_PRDATA_9 PADOUT}
  {right 20 pad_PWDATA_10 PADIN}
  {right 21 pad_PRDATA_10 PADOUT}
  {bottom 2 pad_PWDATA_12 PADIN}
  {bottom 3 pad_PRDATA_12 PADOUT}
  {bottom 4 pad_PWDATA_13 PADIN}
  {bottom 5 pad_PRDATA_13 PADOUT}
  {bottom 6 pad_PWDATA_14 PADIN}
  {bottom 7 pad_PRDATA_14 PADOUT}
  {bottom 8 pad_PWDATA_15 PADIN}
  {bottom 9 pad_PRDATA_15 PADOUT}
  {bottom 10 pad_PWDATA_16 PADIN}
  {bottom 11 pad_PRDATA_16 PADOUT}
  {bottom 12 pad_PWDATA_17 PADIN}
  {bottom 13 pad_PRDATA_17 PADOUT}
  {bottom 14 pad_PWDATA_18 PADIN}
  {bottom 15 pad_PRDATA_18 PADOUT}
  {bottom 16 pad_PWDATA_19 PADIN}
  {bottom 17 pad_PRDATA_19 PADOUT}
  {bottom 18 pad_PWDATA_20 PADIN}
  {bottom 19 pad_PRDATA_20 PADOUT}
  {bottom 20 pad_PWDATA_21 PADIN}
  {bottom 21 pad_PRDATA_21 PADOUT}
  {bottom 22 pad_PWDATA_22 PADIN}
  {bottom 23 pad_PRDATA_22 PADOUT}
  {bottom 24 pad_PCLK PADIN}
  {bottom 25 pad_PRESETN PADIN}
  {left 0 pad_PWDATA_23 PADIN}
  {left 1 pad_PRDATA_23 PADOUT}
  {left 2 pad_PWDATA_24 PADIN}
  {left 3 pad_PRDATA_24 PADOUT}
  {left 4 pad_PWDATA_25 PADIN}
  {left 5 pad_PRDATA_25 PADOUT}
  {left 6 pad_PWDATA_26 PADIN}
  {left 7 pad_PRDATA_26 PADOUT}
  {left 8 pad_PWDATA_27 PADIN}
  {left 9 pad_PRDATA_27 PADOUT}
  {left 10 pad_PWDATA_28 PADIN}
  {left 11 pad_PRDATA_28 PADOUT}
  {left 12 pad_PWDATA_29 PADIN}
  {left 13 pad_PRDATA_29 PADOUT}
  {left 14 pad_PWDATA_30 PADIN}
  {left 15 pad_PRDATA_30 PADOUT}
  {left 16 pad_PWDATA_31 PADIN}
  {left 17 pad_PRDATA_31 PADOUT}
  {left 18 pad_PSEL PADIN}
  {left 19 pad_PENABLE PADIN}
  {left 20 pad_PWRITE PADIN}
  {left 21 pad_PREADY PADOUT}
  {top 16 pad_PADDR_0 PADIN}
  {top 17 pad_PADDR_1 PADIN}
  {top 18 pad_PADDR_2 PADIN}
  {top 19 pad_PADDR_3 PADIN}
  {top 20 pad_PADDR_4 PADIN}
  {top 21 pad_PADDR_5 PADIN}
  {top 22 pad_PADDR_6 PADIN}
  {top 23 pad_PADDR_7 PADIN}
  {top 24 pad_PWDATA_11 PADIN}
  {top 25 pad_PRDATA_11 PADOUT}
}
set PAD_POWER_SLOTS {
  {bottom 0 pad_vdd_b PADVDD}
  {bottom 1 pad_vss_b PADVSS}
  {top 14 pad_vdd_t PADVDD}
  {top 15 pad_vss_t PADVSS}
}

# Tra ve {x y orient} (goc duoi-trai cua bbox sau khi xoay). dw, dh = kich thuoc die.
# Pad thiet ke cho canh duoi (R0): phia core o +y. Canh tren R180, trai R270, phai R90.
proc pad_xy {side idx dw dh} {
    global PAD_W PAD_H PAD_X0 PAD_Y0
    switch -- $side {
        bottom { return [list [expr {$PAD_X0 + $PAD_W * $idx}] 0.0 r0] }
        top    { return [list [expr {$PAD_X0 + $PAD_W * $idx}] [format %.3f [expr {$dh - $PAD_H}]] r180] }
        left   { return [list 0.0 [expr {$PAD_Y0 + $PAD_W * $idx}] r270] }
        right  { return [list [format %.3f [expr {$dw - $PAD_H}]] [expr {$PAD_Y0 + $PAD_W * $idx}] r90] }
    }
    error "pad_xy: side khong hop le: $side"
}

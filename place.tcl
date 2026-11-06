# PH_run06: placement. Pad da co dinh o floorplan.tcl; port top khong gan toa do (pad la diem tiep xuc).
set_multi_cpu_usage -local_cpu 4
place_opt_design
place_detail
place_opt_design -incremental
place_detail

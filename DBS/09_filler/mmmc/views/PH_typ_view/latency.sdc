set_clock_latency -source -early -max -rise  -0.215407 [get_ports {PCLK}] -clock PCLK 
set_clock_latency -source -early -max -fall  -0.217243 [get_ports {PCLK}] -clock PCLK 
set_clock_latency -source -late -max -rise  -0.215407 [get_ports {PCLK}] -clock PCLK 
set_clock_latency -source -late -max -fall  -0.217243 [get_ports {PCLK}] -clock PCLK 

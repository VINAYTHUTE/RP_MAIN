
set_property PACKAGE_PIN A1 [get_ports lvds_p]
set_property PACKAGE_PIN A2 [get_ports lvds_n]
set_property IOSTANDARD LVDS [get_ports lvds_p]
set_property IOSTANDARD LVDS [get_ports lvds_n]
create_clock -name clk -period 5.0 [get_ports clk]
create_clock -name clk_div -period 30.0 [get_ports clk_div]

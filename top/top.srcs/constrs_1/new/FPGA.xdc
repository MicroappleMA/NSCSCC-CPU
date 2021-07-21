#时钟信号连接
set_property PACKAGE_PIN AC19 [get_ports clk_100m]

#脉冲开关，用于输入作为复位信号，低电平有效
set_property PACKAGE_PIN Y3 [get_ports rst]

#脉冲开关，用于输入作为单步执行的clk
set_property PACKAGE_PIN Y5 [get_ports clk]

set_property IOSTANDARD LVCMOS33 [get_ports clk_100m]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

#触摸屏引脚连接
set_property PACKAGE_PIN J25 [get_ports lcd_rst]
set_property PACKAGE_PIN H18 [get_ports lcd_cs]
set_property PACKAGE_PIN K16 [get_ports lcd_rs]
set_property PACKAGE_PIN L8 [get_ports lcd_wr]
set_property PACKAGE_PIN K8 [get_ports lcd_rd]
set_property PACKAGE_PIN J15 [get_ports lcd_bl_ctr]
set_property PACKAGE_PIN H9 [get_ports {lcd_data_io[0]}]
set_property PACKAGE_PIN K17 [get_ports {lcd_data_io[1]}]
set_property PACKAGE_PIN J20 [get_ports {lcd_data_io[2]}]
set_property PACKAGE_PIN M17 [get_ports {lcd_data_io[3]}]
set_property PACKAGE_PIN L17 [get_ports {lcd_data_io[4]}]
set_property PACKAGE_PIN L18 [get_ports {lcd_data_io[5]}]
set_property PACKAGE_PIN L15 [get_ports {lcd_data_io[6]}]
set_property PACKAGE_PIN M15 [get_ports {lcd_data_io[7]}]
set_property PACKAGE_PIN M16 [get_ports {lcd_data_io[8]}]
set_property PACKAGE_PIN L14 [get_ports {lcd_data_io[9]}]
set_property PACKAGE_PIN M14 [get_ports {lcd_data_io[10]}]
set_property PACKAGE_PIN F22 [get_ports {lcd_data_io[11]}]
set_property PACKAGE_PIN G22 [get_ports {lcd_data_io[12]}]
set_property PACKAGE_PIN G21 [get_ports {lcd_data_io[13]}]
set_property PACKAGE_PIN H24 [get_ports {lcd_data_io[14]}]
set_property PACKAGE_PIN J16 [get_ports {lcd_data_io[15]}]
set_property PACKAGE_PIN L19 [get_ports ct_int]
set_property PACKAGE_PIN J24 [get_ports ct_sda]
set_property PACKAGE_PIN H21 [get_ports ct_scl]
set_property PACKAGE_PIN G24 [get_ports ct_rstn]

set_property IOSTANDARD LVCMOS33 [get_ports lcd_rst]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_cs]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rs]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_wr]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_rd]
set_property IOSTANDARD LVCMOS33 [get_ports lcd_bl_ctr]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {lcd_data_io[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports ct_int]
set_property IOSTANDARD LVCMOS33 [get_ports ct_sda]
set_property IOSTANDARD LVCMOS33 [get_ports ct_scl]
set_property IOSTANDARD LVCMOS33 [get_ports ct_rstn]

#拨码开关
set_property PACKAGE_PIN AC21 [get_ports {sw[7]}]
set_property PACKAGE_PIN AD24 [get_ports {sw[6]}]
set_property PACKAGE_PIN AC22 [get_ports {sw[5]}]
set_property PACKAGE_PIN AC23 [get_ports {sw[4]}]
set_property PACKAGE_PIN AB6 [get_ports {sw[3]}]
set_property PACKAGE_PIN W6 [get_ports {sw[2]}]
set_property PACKAGE_PIN AA7 [get_ports {sw[1]}]
set_property PACKAGE_PIN Y6 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]

#LED灯
set_property PACKAGE_PIN H7 [get_ports {led[15]}]
set_property PACKAGE_PIN D5 [get_ports {led[14]}]
set_property PACKAGE_PIN A3 [get_ports {led[13]}]
set_property PACKAGE_PIN A5 [get_ports {led[12]}]
set_property PACKAGE_PIN A4 [get_ports {led[11]}]
set_property PACKAGE_PIN F7 [get_ports {led[10]}]
set_property PACKAGE_PIN G8 [get_ports {led[9]}]
set_property PACKAGE_PIN H8 [get_ports {led[8]}]
set_property PACKAGE_PIN J8 [get_ports {led[7]}]
set_property PACKAGE_PIN J23 [get_ports {led[6]}]
set_property PACKAGE_PIN J26 [get_ports {led[5]}]
set_property PACKAGE_PIN G9 [get_ports {led[4]}]
set_property PACKAGE_PIN J19 [get_ports {led[3]}]
set_property PACKAGE_PIN H23 [get_ports {led[2]}]
set_property PACKAGE_PIN J21 [get_ports {led[1]}]
set_property PACKAGE_PIN K23 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

#4×4键盘矩阵
set_property PACKAGE_PIN V8 [get_ports {key_col[0]}]
set_property PACKAGE_PIN V9 [get_ports {key_col[1]}]
set_property PACKAGE_PIN Y8 [get_ports {key_col[2]}]
set_property PACKAGE_PIN V7 [get_ports {key_col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_col[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_col[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_col[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_col[0]}]

set_property PACKAGE_PIN U7 [get_ports {key_row[0]}]
set_property PACKAGE_PIN W8 [get_ports {key_row[1]}]
set_property PACKAGE_PIN Y7 [get_ports {key_row[2]}]
set_property PACKAGE_PIN AA8 [get_ports {key_row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_row[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_row[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_row[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {key_row[0]}]

#共阴极八段数码管
set_property PACKAGE_PIN D3 [get_ports {AN[7]}]
set_property PACKAGE_PIN D25 [get_ports {AN[6]}]
set_property PACKAGE_PIN D26 [get_ports {AN[5]}]
set_property PACKAGE_PIN E25 [get_ports {AN[4]}]
set_property PACKAGE_PIN E26 [get_ports {AN[3]}]
set_property PACKAGE_PIN G25 [get_ports {AN[2]}]
set_property PACKAGE_PIN G26 [get_ports {AN[1]}]
set_property PACKAGE_PIN H26 [get_ports {AN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]

set_property PACKAGE_PIN A2 [get_ports {Seg[7]}]
set_property PACKAGE_PIN D4 [get_ports {Seg[6]}]
set_property PACKAGE_PIN E5 [get_ports {Seg[5]}]
set_property PACKAGE_PIN B4 [get_ports {Seg[4]}]
set_property PACKAGE_PIN B2 [get_ports {Seg[3]}]
set_property PACKAGE_PIN E6 [get_ports {Seg[2]}]
set_property PACKAGE_PIN C3 [get_ports {Seg[1]}]
set_property PACKAGE_PIN C4 [get_ports {Seg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Seg[0]}]

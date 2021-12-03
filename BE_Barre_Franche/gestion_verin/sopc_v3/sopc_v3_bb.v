
module sopc_v3 (
	address_external_connection_export,
	angle_barre_external_connection_export,
	butee_d_external_connection_export,
	butee_g_external_connection_export,
	chip_select_external_connection_export,
	clk_clk,
	raz_external_connection_export,
	duty_external_connection_export,
	frequency_external_connection_export,
	read_data_external_connection_export,
	sens_external_connection_export,
	write_data_external_connection_export,
	write_n_external_connection_export,
	enable_external_connection_export,
	fin_butee_external_connection_export);	

	input	[2:0]	address_external_connection_export;
	input	[11:0]	angle_barre_external_connection_export;
	output	[11:0]	butee_d_external_connection_export;
	output	[11:0]	butee_g_external_connection_export;
	input		chip_select_external_connection_export;
	input		clk_clk;
	output		raz_external_connection_export;
	output	[15:0]	duty_external_connection_export;
	output	[15:0]	frequency_external_connection_export;
	output	[31:0]	read_data_external_connection_export;
	output		sens_external_connection_export;
	input	[31:0]	write_data_external_connection_export;
	input		write_n_external_connection_export;
	output		enable_external_connection_export;
	output	[1:0]	fin_butee_external_connection_export;
endmodule

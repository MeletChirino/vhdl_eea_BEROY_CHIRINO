
module sopc_v3 (
	angle_barre_external_connection_export,
	butee_d_external_connection_export,
	butee_g_external_connection_export,
	clk_clk,
	duty_external_connection_export,
	frequency_external_connection_export,
	read_data_external_connection_export,
	sens_external_connection_export,
	write_data_external_connection_export);	

	input	[11:0]	angle_barre_external_connection_export;
	output	[11:0]	butee_d_external_connection_export;
	output	[11:0]	butee_g_external_connection_export;
	input		clk_clk;
	output	[15:0]	duty_external_connection_export;
	output	[15:0]	frequency_external_connection_export;
	output	[31:0]	read_data_external_connection_export;
	output		sens_external_connection_export;
	input	[31:0]	write_data_external_connection_export;
endmodule

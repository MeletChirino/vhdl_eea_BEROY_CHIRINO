	component sopc_v3 is
		port (
			butee_d_external_connection_export     : out std_logic_vector(11 downto 0);                    -- export
			butee_g_external_connection_export     : out std_logic_vector(11 downto 0);                    -- export
			clk_clk                                : in  std_logic                     := 'X';             -- clk
			duty_external_connection_export        : out std_logic_vector(15 downto 0);                    -- export
			frequency_external_connection_export   : out std_logic_vector(15 downto 0);                    -- export
			angle_barre_external_connection_export : in  std_logic_vector(11 downto 0) := (others => 'X'); -- export
			read_data_external_connection_export   : out std_logic_vector(31 downto 0);                    -- export
			write_data_external_connection_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			sens_external_connection_export        : out std_logic                                         -- export
		);
	end component sopc_v3;

	u0 : component sopc_v3
		port map (
			butee_d_external_connection_export     => CONNECTED_TO_butee_d_external_connection_export,     --     butee_d_external_connection.export
			butee_g_external_connection_export     => CONNECTED_TO_butee_g_external_connection_export,     --     butee_g_external_connection.export
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                             clk.clk
			duty_external_connection_export        => CONNECTED_TO_duty_external_connection_export,        --        duty_external_connection.export
			frequency_external_connection_export   => CONNECTED_TO_frequency_external_connection_export,   --   frequency_external_connection.export
			angle_barre_external_connection_export => CONNECTED_TO_angle_barre_external_connection_export, -- angle_barre_external_connection.export
			read_data_external_connection_export   => CONNECTED_TO_read_data_external_connection_export,   --   read_data_external_connection.export
			write_data_external_connection_export  => CONNECTED_TO_write_data_external_connection_export,  --  write_data_external_connection.export
			sens_external_connection_export        => CONNECTED_TO_sens_external_connection_export         --        sens_external_connection.export
		);


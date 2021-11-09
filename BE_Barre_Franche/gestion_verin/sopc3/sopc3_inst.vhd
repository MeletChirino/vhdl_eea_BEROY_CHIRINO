	component sopc3 is
		port (
			angle_barre_external_connection_export : out std_logic_vector(11 downto 0);                    -- export
			butee_d_external_connection_export     : out std_logic_vector(11 downto 0);                    -- export
			butee_g_external_connection_export     : out std_logic_vector(11 downto 0);                    -- export
			clk_clk                                : in  std_logic                     := 'X';             -- clk
			duty_external_connection_export        : out std_logic_vector(15 downto 0);                    -- export
			freq_external_connection_export        : out std_logic_vector(15 downto 0);                    -- export
			sens_external_connection_export        : out std_logic;                                        -- export
			write_data_external_connection_export  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			write_n_external_connection_export     : in  std_logic                     := 'X'              -- export
		);
	end component sopc3;

	u0 : component sopc3
		port map (
			angle_barre_external_connection_export => CONNECTED_TO_angle_barre_external_connection_export, -- angle_barre_external_connection.export
			butee_d_external_connection_export     => CONNECTED_TO_butee_d_external_connection_export,     --     butee_d_external_connection.export
			butee_g_external_connection_export     => CONNECTED_TO_butee_g_external_connection_export,     --     butee_g_external_connection.export
			clk_clk                                => CONNECTED_TO_clk_clk,                                --                             clk.clk
			duty_external_connection_export        => CONNECTED_TO_duty_external_connection_export,        --        duty_external_connection.export
			freq_external_connection_export        => CONNECTED_TO_freq_external_connection_export,        --        freq_external_connection.export
			sens_external_connection_export        => CONNECTED_TO_sens_external_connection_export,        --        sens_external_connection.export
			write_data_external_connection_export  => CONNECTED_TO_write_data_external_connection_export,  --  write_data_external_connection.export
			write_n_external_connection_export     => CONNECTED_TO_write_n_external_connection_export      --     write_n_external_connection.export
		);


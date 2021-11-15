	component mon_sopc is
		port (
			clk_clk                             : in  std_logic                    := 'X';             -- clk
			bouttons_external_connection_export : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			leds_external_connection_export     : out std_logic_vector(7 downto 0)                     -- export
		);
	end component mon_sopc;

	u0 : component mon_sopc
		port map (
			clk_clk                             => CONNECTED_TO_clk_clk,                             --                          clk.clk
			bouttons_external_connection_export => CONNECTED_TO_bouttons_external_connection_export, -- bouttons_external_connection.export
			leds_external_connection_export     => CONNECTED_TO_leds_external_connection_export      --     leds_external_connection.export
		);


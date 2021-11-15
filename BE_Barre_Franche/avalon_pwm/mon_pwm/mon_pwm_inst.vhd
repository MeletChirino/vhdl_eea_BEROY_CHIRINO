	component mon_pwm is
		port (
			clk_clk                                : in  std_logic := 'X'; -- clk
			pwm_0_conduit_end_writeresponsevalid_n : out std_logic         -- writeresponsevalid_n
		);
	end component mon_pwm;

	u0 : component mon_pwm
		port map (
			clk_clk                                => CONNECTED_TO_clk_clk,                                --               clk.clk
			pwm_0_conduit_end_writeresponsevalid_n => CONNECTED_TO_pwm_0_conduit_end_writeresponsevalid_n  -- pwm_0_conduit_end.writeresponsevalid_n
		);


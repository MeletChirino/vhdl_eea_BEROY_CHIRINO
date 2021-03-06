Library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

package tools is

	component counter is
		port(
			clk_1Hz: in std_logic;
			rst: in std_logic;
			in_freq_anemo: in std_logic;
			freq_out: out std_logic_vector(7 downto 0)
		    );
	end component;
	
	component time_divider is
		port(
			clk_in		: in std_logic;
			clock_1Hz	: out std_logic;
			end_o   : out std_logic
		);
	end component;
	
	component select_mode is
	port(
		clk_1Hz: in std_logic;
		mode_continu: in std_logic;
		signal_start_stop: in std_logic;
		freq_anem_in	: in std_logic_vector(7 downto 0);
		signal_data_valid: out std_logic;
		freq_anem_out	: out std_logic_vector(7 downto 0)
	    );
	end component;

end tools;

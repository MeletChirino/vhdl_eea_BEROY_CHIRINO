Library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

package tools is
	component projet_anemometre is
		port(
			raz_n  : in std_logic;
			continu  : in std_logic;
			start_stop  : in std_logic;
			clk_50M	: in std_logic;
			in_freq_anemometre : in std_logic;
			data_valid : out std_logic;
			LED_TEST : out std_logic;
			data_anemometre	: out std_logic_vector(7 downto 0)
			);
	end component;


	component counter is
		port(
			clk_1Hz: in std_logic;
			--clk_50M : in std_logic;
			rst: in std_logic;
			in_freq_anemo: in std_logic;
			freq_out: out std_logic_vector(7 downto 0);
			CLOCK1: out std_logic
		    );
	end component;
	
	component time_divider is
		port(
			clk_in		: in std_logic;
			clock_1Hz	: out std_logic;
			end_o   : out std_logic
		);
	end component;
	
--	component pwm is
--	port(
--		clk_in		: in std_logic;
--		pwm_out		: out std_logic
--	    );
--	end component;
	
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

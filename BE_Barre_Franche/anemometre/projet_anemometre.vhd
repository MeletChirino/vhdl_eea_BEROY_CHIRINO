library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

library	work;
use 	work.tools.all;

entity projet_anemometre is
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
end entity;

architecture rtl of projet_anemometre is      
	
	signal enable_1Hz	: std_logic;
	signal time_1Hz	: std_logic;
	signal time_pwm	: std_logic;
	signal freq_temp  : std_logic_vector(7 downto 0);
	--signal reset		: std_logic := '0';
	
begin

	diviseur	: time_divider port map (
			clk_in		=> clk_50M,
			clock_1Hz	=> time_1Hz,
			end_o  => enable_1Hz
			);
	
--	signal_pwm	: pwm port map (
--			clk_in => clk_50M,
--			pwm_out => time_pwm
--			);
			
	acumulateur	: counter port map(
			--senhal externa => senhal interna
			clk_1Hz => time_1Hz,
			CLOCK1 => LED_TEST,
			rst => raz_n,
			in_freq_anemo => in_freq_anemometre,
			freq_out => freq_temp
			);
	
	mode	: select_mode port map (
			clk_1Hz => time_1Hz,
			freq_anem_in => freq_temp,
			freq_anem_out => data_anemometre,
			mode_continu => continu,
			signal_start_stop => start_stop,
			signal_data_valid => data_valid
			);
			
end rtl;


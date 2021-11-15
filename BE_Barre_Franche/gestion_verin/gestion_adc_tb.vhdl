
--test bench  for gestion butees
library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library work;
use	work.tools.all;

entity gestion_adc_tb is
end entity;

architecture test of gestion_adc_tb is
	--test signals 
	signal clk 	: std_logic := '0';
	signal clk_adc_s	: std_logic := '0';
	signal data	: std_logic_vector(11 downto 0) := x"445";
	signal data_in	: std_logic := '0';
	signal cs_n	: std_logic;
	signal fin_c	: std_logic;
	signal angle	: std_logic_vector(11 downto 0) := x"000";
	signal enable	: std_logic;
	signal num	: integer range 0 to 13 := 1;
begin
	clk_adc		: clk_1MHz port map (
			clk_in	=> clk,
			clk_out	=> clk_adc_s
			);
	reg_dec		: shift_register port map (
			enable 		=> enable,
			data_in		=> data_in,
			--angle_barre 	=> data,
			fin_c		=> fin_c,
			clk_in		=> clk_adc_s
			);
	machine_etat	: pilote_adc port map(
			clk_in		=> clk_adc_s,
			cs_n		=> cs_n,
			enable		=> enable,
			fin_c		=> fin_c
			);
	clk <= not clk after 20 ns;

	SEND_DATA	: process(clk_adc_s, enable)
	begin
		if (clk_adc_s'event and clk_adc_s = '0') then
		if(enable = '1') then
			if (num = 12) then 
				num <= 1;
			else
				data_in <= data(num - 1);
				num <= num + 1;
				end if;
			end if;
		end if;
	end process SEND_DATA;

end test;

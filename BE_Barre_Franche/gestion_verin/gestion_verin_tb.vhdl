library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library	work;
use 	work.tools.all;

entity gestion_verin_tb is
end entity;

architecture test of gestion_verin_tb is
	signal clk_50M	: std_logic := '1';
	signal clk_adc	: std_logic := '1';
	signal data	: std_logic_vector(11 downto 0) := x"abc";
	signal data_in	: std_logic := data(0);
	signal final_data	: std_logic_vector(11 downto 0);
	signal i	: integer := 0;
begin
	clk_50		: clk_50MHz port map(
		output		=> clk_50M
				    );
	clk_adc_p	: clk_1MHz  port map(
		--internal signal => external signal
		clk_in		=> clk_50M,
		clk_out		=> clk_adc
	);
	shift_reg	: shift_register port map(
		data_in		=> data_in,
		clk_in		=> clk_adc
		--angle_barre	=> final_data		
	);
	data_load	: process(clk_adc) is
	begin
		if (clk_adc'event and clk_adc ='1') then
			data_in <= data(i);
			i <= i + 1;
		end if;
		if (i = 12) then
			i <= 0;
		end if;
	end process data_load;
end test;

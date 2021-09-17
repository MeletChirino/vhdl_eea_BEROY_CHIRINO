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
	signal clk	: std_logic := '0';
	signal clk_adc	: std_logic := '0';
begin
	clk_adc_p	: clk_1MHz  port map(
		--internal signal => external signal
		clk_in		=> clk,
		clk_out		=> clk_adc
	);
	process begin
		clk <= '1';
		for i in 0 to 400 loop
			wait for 10 ns;
			clk <= '0';
			wait for 10 ns;
			clk <= '1';
		end loop;
	end process;
end test;

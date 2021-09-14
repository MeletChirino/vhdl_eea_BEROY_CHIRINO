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
	signal freq	: std_logic_vector(15 downto 0) := x"07d0";
	signal duty	: std_logic_vector(15 downto 0) := x"0002";
begin
	pwm		: pwm_module port map(
		clk_in		=> clk,
		freq		=> freq,
		duty		=> duty
	);
	process begin
		for i in 0 to 10 loop
			wait for 10 ns;
			clk <= '1';
			wait for 10 ns;
			clk <= '0';
		end loop;
		duty <= x"0700";
		for i in 0 to 10 loop
			wait for 10 ns;
			clk <= '1';
			wait for 10 ns;
			clk <= '0';
		end loop;
	end process;
		
end test;

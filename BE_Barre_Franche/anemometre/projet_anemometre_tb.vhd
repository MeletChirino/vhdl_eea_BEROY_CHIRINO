--test bench for anemometre
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

library	work;
use 	work.tools.all;

entity projet_anemometre_tb is
end entity;

architecture test of projet_anemometre_tb is      
	signal raz_n	: std_logic := '1';
	signal continu	: std_logic := '1';
	signal st		: std_logic := '0';
	signal clk_50M	: std_logic := '0';
	signal in_freq 	: std_logic;
begin
	anemo		: projet_anemometre port map (
		raz_n		=> raz_n,
		continu		=> continu,
		start_stop	=> st,
		in_freq_anemometre	=> in_freq,
		clk_50M				=> clk_50M
	);
	clk_50M <= not clk_50M after 20 ns;

	freq		: process is
		begin
			for i in 0 to 400000 loop
				wait for 10 ms;
				in_freq <= '1';
				wait for 10 ms;
				in_freq <= '0';
			end loop;
		end process freq;
			
end test;


Library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

entity diviseur_tb is
end entity;

architecture test of diviseur_tb is
	component diviseur
		port( 
		   clk: in std_logic;
		   clock_out: out std_logic
		);
	end component;
	signal clk_in	: std_logic := '0';
	signal output	: std_logic := '0';
begin
	map1 : diviseur port map(
		--puerto externo => senhal local
		clk		=> clk_in,
		clock_out	=> output
	);

	process begin
		for i in 0 to 150000000 loop
			wait for 20 ns;
			clk_in <= '1';
			wait for 20 ns;
			clk_in <= '0';
		end loop;
	end process;
end test;

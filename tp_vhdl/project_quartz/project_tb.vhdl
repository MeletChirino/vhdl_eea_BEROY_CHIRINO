Library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

entity project_tb is
end entity;

architecture test of project_tb is
	component project
		port( 
			clk_in	: in std_logic;
			output	: out std_logic_vector(6 downto 0)
		);
	end component;
	signal clk	: std_logic := '0';
	signal bcd_output	: std_logic_vector(6 downto 0);
begin
	simulation : project port map(
		--puerto externo => senhal local
		clk_in => clk,
		output => bcd_output
	);

	process begin
		for i in 0 to 1500000000 loop
			wait for 20 ns;
			clk <= '1';
			wait for 20 ns;
			clk <= '0';
		end loop;
	end process;
end test;

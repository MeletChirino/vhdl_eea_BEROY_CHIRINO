library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;

architecture test of counter_tb is
	component counter
		port( 
			input	: in std_logic;
			output 	: out std_logic_vector(3 downto 0)
		);
	end component;
	signal input	: std_logic := '0';
	signal output	: std_logic_vector(3 downto 0);
begin
	count : counter port map(
		input	=> input,
		output	=> output
		);

	process begin
		for i in 0 to  20 loop
			wait for 0.5 ns;
			input <= '1';
			wait for 0.5 ns;
			input <= '0';
		end loop;
		wait;
	end process;
end test;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity bcd_7sg_tb is
end entity;

architecture test of bcd_7sg_tb is
	component bcd_7sg
		port(
		input	: in std_logic_vector(3 downto 0);
		output	: out std_logic_vector(6 downto 0)
		    );
	end component;
	signal input 	: std_logic_vector(3 downto 0) := "0000";
	signal output	: std_logic_vector(6 downto 0);
begin
	bcd : bcd_7sg port map(
		input => input,
		output => output
	      );

	process begin
		for i in 9 downto 0 loop
			wait for 1 ns;
			input <= input + "0001";
		end loop;
		wait;
	end process;
end test;

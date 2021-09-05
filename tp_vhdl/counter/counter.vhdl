library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity counter is
	port(
		input	: in std_logic;
		output 	: out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl of counter is
	signal number	: std_logic_vector(3 downto 0) := "0000";
begin
	number <= number + "0001" when input = '1';
	--output <= number(3 downto 0);
	output(1) <= input;


end rtl;

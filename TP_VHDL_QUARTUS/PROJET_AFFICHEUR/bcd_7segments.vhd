library ieee;
use ieee.std_logic_1164.all;

entity bcd_7segments is
	port(
		input_7sg	: in std_logic_vector(3 downto 0);
		output_7sg	: out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of bcd_7segments is
begin
	with input_7sg select output_7sg <=
		"0000001" when x"0",
		"1001111" when x"1",
		"0010010" when x"2",
		"0000110" when x"3",
		"1001100" when x"4",
		"0100100" when x"5",
		"0100000" when x"6",
		"0001111" when x"7",
		"0000000" when x"8",
		"0001100" when x"9",
		"1111111" when others;
end rtl;

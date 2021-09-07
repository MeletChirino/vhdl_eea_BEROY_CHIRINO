library ieee;
use ieee.std_logic_1164.all;

entity bcd_7sg is
	port(
		input	: in std_logic_vector(3 downto 0);
		output	: out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of bcd_7sg is
begin
	with input select output <=
		"1111110" when x"0",
		"0110000" when x"1",
		"1100101" when x"2",
		"1111001" when x"3",
		"0100011" when x"4",
		"1011011" when x"5",
		"1011111" when x"6",
		"1110000" when x"7",
		"1111111" when x"8",
		"1110011" when x"9",
		"0000000" when others;
	for i in 6 downto 0 loop
		output(i) <= not output(i);
	end loop
end rtl;

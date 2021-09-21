--Shift register to store data. The MSB is bit 0
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity shift_register is
	port(
		enable		: in std_logic;
		number		: in std_logic_vector(3 downto 0);
		data_in		: in std_logic;
		angle_barre	: out std_logic_vector(0 to 11) := x"000";
		clk_in		: in std_logic := '0'
	);
end entity;

architecture rtl of shift_register is
	signal buff_data	: std_logic_vector(0 to 11);
	signal number_i		: integer;
begin
	--rec_dec process
	number_i <= to_integer(unsigned(number));
	rec_dec	: process(clk_in) is
	begin
		if (enable = '1') then
			if not(number = x"c") then
				buff_data(number_i) <= data_in;
			end if;
		else
			angle_barre <= buff_data;
		end if;

	end process rec_dec;
end rtl;

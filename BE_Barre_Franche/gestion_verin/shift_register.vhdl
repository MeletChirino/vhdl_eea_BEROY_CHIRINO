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
	signal angle_barre_s	: std_logic_vector(0 to 11);
	signal number_i		: integer range 0 to 13;
begin
	--rec_dec process
	number_i <= to_integer(unsigned(number));
	rec_dec	: process(clk_in, data_in, number) is
	begin
		if (clk_in'event and clk_in = '0') then
		if (enable = '1') then
			if (number < x"b") then
				buff_data(number_i) <= data_in;
			end if;
		else
			angle_barre_s <= buff_data;
		end if;
		end if;
	end process rec_dec;
	angle_barre <= angle_barre_s;
end rtl;

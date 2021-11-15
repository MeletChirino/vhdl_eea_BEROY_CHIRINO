--Shift register to store data. The MSB is bit 0
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity shift_register is
	port(
		enable		: in std_logic;
		data_in		: in std_logic;
		angle_barre	: out std_logic_vector(0 to 11) := x"000";
		fin_c		: out std_logic := '0';
		clk_in		: in std_logic := '0'
	);
end entity;

architecture rtl of shift_register is
	signal buff_data	: std_logic_vector(0 to 11);
	signal angle_barre_s	: std_logic_vector(0 to 11);
	signal number		: integer range 0 to 13;
begin
	--rec_dec process
	rec_dec	: process(clk_in) is
	begin
		if (clk_in'event and clk_in = '0') then
		if (enable = '1') then
			if (number < 12) then
				buff_data(number) <= data_in;
			else 
				fin_c <= '1';
			end if;
		else
			fin_c <= '0';
			angle_barre_s <= buff_data;
		end if;
		end if;
	end process rec_dec;

	COMPT_FRONT : process(clk_in) is
	begin
		if (clk_in'event and clk_in = '1') then
			if (enable = '1') then 
				number <= number + 1;
			end if;
			if (number = 12) then
				number <= 0;
			end if;
		end if;
	end process COMPT_FRONT;

	angle_barre <= angle_barre_s;
end rtl;

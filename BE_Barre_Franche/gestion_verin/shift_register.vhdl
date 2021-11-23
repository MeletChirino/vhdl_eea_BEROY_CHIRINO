--Shift register to store data. The MSB is bit 0
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity shift_register is
	port(
		cs_n		: in std_logic;
		data_in		: in std_logic;
		angle_barre	: out std_logic_vector(0 to 11);
		fin_c		: out std_logic;
		clk_in		: in std_logic
	);
end entity;

architecture rtl of shift_register is
	signal buff_data	: std_logic_vector(0 to 11);
	signal angle_barre_s	: std_logic_vector(0 to 11);
	signal number		: integer range 0 to 16 := 0;
begin
	--rec_dec process
	rec_dec	: process(clk_in) is
	begin
		if (clk_in'event and clk_in = '1') then
			if (number < 3) then
				fin_c <= '0';
			elsif (number > 2 and number < 15) then
				buff_data(number - 3) <= data_in;
				fin_c <= '0';
			elsif (number = 15) then 
				fin_c <= '1';
			elsif (number = 16) then 
				angle_barre_s <= buff_data;
				fin_c <= '0';
				end if;
			end if;
	end process rec_dec;

	COMPT_FRONT : process(clk_in, cs_n) is
	begin
		if (clk_in'event and clk_in = '0') then
			if (number < 16) then
				number <= number + 1;
				end if;
			if (cs_n = '1') then
				--reset condition
				number <= 0;
				end if;
			end if;
	end process COMPT_FRONT;

	angle_barre <= angle_barre_s;
end rtl;

-- Rising edge counter for shift register
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity shift_register is
	port(
		data_in		: in std_logic;
		angle_barre	: out std_logic_vector(11 downto 0) := x"000";
		clk_in		: in std_logic := '0'
	);
end entity;

architecture rtl of shift_register is
	signal number		: integer := 0;
	signal output_signal	: std_logic := '0';
	signal buff_data	: std_logic_vector(11 downto 0);
	signal warn		: std_logic := '0';
begin
	--compt_fronts process
	compt_front : process(clk_in) is
	begin
		if (clk_in'event and clk_in = '1') then
			number <= number + 1;
		end if;
		if (number = 12) then
			number <= 0;
		end if;
	end process compt_front;

	--rec_dec process
	rec_dec	: process(clk_in) is
	begin
		if not(number = 12) then
			buff_data(number) <= data_in;
			warn <= not(warn);
		else
			angle_barre <= buff_data;
		end if;
	end process rec_dec;
end rtl;

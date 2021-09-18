-- Rising edge counter for shift register
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity compt_front is
	port(
		clk_in		: in std_logic;
		enable		: in std_logic;
		counter		: out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl of compt_front is
	signal number	: std_logic_vector(3 downto 0) := x"0";
begin
	compt_front_p	: process(clk_in) is
	begin
		if(enable = '1') then
			if (clk_in'event and clk_in =  '1') then
				number <= number + x"1";
				if (number = x"c") then
					number <= x"0";
				end if;
			end if;
		else
			number <= x"0";
		end if;
	end process compt_front_p;
	counter <= number;
			
end rtl;

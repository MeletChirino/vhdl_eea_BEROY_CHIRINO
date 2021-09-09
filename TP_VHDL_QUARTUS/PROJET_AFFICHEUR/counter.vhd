library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity counter is
	port(
		input_counter	: in std_logic;
		C	: in std_logic;
		reset	: in std_logic;		
		output_counter 	: out std_logic_vector(3 downto 0)
	);
end entity;

architecture rtl of counter is
	signal number	: std_logic_vector(3 downto 0) := x"0";
begin
	sum : process (input_counter, c, reset, number) is

begin
	if reset = '1' then 
		--if there RESET is pressed
		number <= x"0";
	else
		if (input_counter'event and input_counter = '1') then
			if c = '1' then
				number <= number + x"1";
					if number > x"8" then
					--for reinitializing counter when it is growing
						number <= x"0";
					end if;
			elsif c = '0' then
				number <= number - x"1";
					if number = x"0" then
					--for reinitializing counter when it is growing
						number <= x"9";
					end if;
			end if;
	end if;  
end if;	       
	output_counter <= number;

end process sum;
end rtl;
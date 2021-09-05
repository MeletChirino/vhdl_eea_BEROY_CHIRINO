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
	sum : process (input) is

begin

        if input = '1' then

            number <= number + "0001";

        end if;

	output <= number;

end process sum;

end rtl;

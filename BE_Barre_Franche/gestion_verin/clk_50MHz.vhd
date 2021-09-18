
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library	work;
use 	work.tools.all;

entity clk_50MHz is
	port (
		output	: out std_logic := 0
	);
end entity;

architecture test of clk_50MHz is
begin
	process begin
		for j in 0 to 400000 loop
			wait for 10 ns;
			output <= '1';
			wait for 10 ns;
			output <= '0';
		end loop;
	end process;
end test;

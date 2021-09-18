--periodic generator 100ms
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity gene_start_conv is
	port(
		clk_in		: in std_logic;
		cs_n		: out std_logic
	);
end entity;

architecture rtl of gene_start_conv is
	signal number 	: std_logic_vector(15 downto 0) := x"0000";
	signal output	: std_logic := '0';
begin
	process(clk_in)
	begin
		if(clk_in'event and clk_in = '1') then
			number <= number + x"0001";
			if(number = x"c350") then
			--if(number = x"000d") then
				number <= x"0000";
				output <= '1';
			end if;
		else
			output <= '0';
		end if;
	end process;
	cs_n <= output;

end rtl;

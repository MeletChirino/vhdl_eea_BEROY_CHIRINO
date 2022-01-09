--periodic generator 100ms
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity gene_start_conv is
	port(
		--inputs
		clk_in		: in std_logic;
		--outputs
		cs_n			: out std_logic
	);
end entity;

architecture rtl of gene_start_conv is
	signal number 	: std_logic_vector(15 downto 0) := x"0000";
	signal output	: std_logic := '0';
begin
	process(clk_in)
	begin
		if(clk_in'event and clk_in =  '1') then
			number <= number + x"0001";
		end if;
		if (number > x"c349") then
		--if (number > x"00f3") then
			output <= not output;
			number <= x"0000";
		end if;
	end process;
	--cs_n <= '1' when (number > x"c349") else '0';
	cs_n <= output;

end rtl;

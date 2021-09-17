library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity clk_1MHz is
	port(
		clk_in	: in std_logic;
		clk_out	: out std_logic := '0'
	);
end entity;

architecture rtl of clk_1MHz is
	signal number		: integer := 0;
	signal output_signal	: std_logic := '0';
begin
	gene_1M	: process(clk_in) is
	begin
		if (clk_in'event and clk_in = '1') then
			number <= number + 1;
		end if;
		if (number = 50) then
			output_signal <= not output_signal;
			number <= 0;
		end if;
	end process gene_1m;
	clk_out <= output_signal;
end rtl;

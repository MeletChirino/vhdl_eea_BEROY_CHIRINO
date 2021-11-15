library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity clk_1MHz is
	port(
		clk_in	: in std_logic;
		clk_out	: out std_logic
	);
end entity;

architecture rtl of clk_1MHz is
	signal output_signal	: std_logic := '1';
begin
	gene_1M	: process(clk_in) is
		variable counter : integer range 0 to 50;
	begin
		if (clk_in'event and clk_in = '1') then
			counter := counter + 1;
			if (counter > 24) then
				output_signal <= not output_signal;
				counter := 0;
			end if;
		end if;

	end process gene_1m;
	clk_out <= output_signal;
end rtl;

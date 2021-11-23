--state machine that handles adc
library	ieee;
use	ieee.std_logic_unsigned.all;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity pilote_adc is
	port(
		clk_in	: in std_logic;
		cs_n	: out std_logic;
		fin_c	: in std_logic;
		enable	: out std_logic
	);
end entity;

architecture rtl of pilote_adc is
	type state_type is (s0, s1, s2);
	signal state	: state_type := s0;
	signal cs_n_s		: std_logic;
begin
	cs_n <= cs_n_s;
	gene_conv	: process(clk_in) is
		variable count	: natural range 0 to 50000;
	begin
		if (clk_in'event and clk_in = '1') then
			count := count + 1;
			if (count >= 49999) then
				cs_n_s <= not cs_n_s;
				count := 0;
				end if;
			end if;
	end process gene_conv;

	process(clk_in, fin_c)
	--here you manage the changes of state machine
		variable sampling : integer range 0 to 4;
	begin
		case state is
			when s0=>
			enable <= '0';
			--do nothing state
				if (cs_n_s = '0') then
					state <= s1;
					sampling := 0;
					end if;
			when s1=>
				enable <= '0';
				--wait for convertion state
				--wait for 3 rising edges for sampling time
				if (clk_in = '1') then
					if(sampling = 3) then
						state <= s2;
						end if;
					sampling := sampling + 1;
				end if;
			when s2=>
			--save data state
				enable <= '1';
				if (fin_c = '1') then
					state <= s0;
				end if;
		end case;
	end process;
	

end rtl;

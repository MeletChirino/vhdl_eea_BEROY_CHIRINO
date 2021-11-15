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
	signal state	: state_type;
	signal cs_n_s		: std_logic;
begin
	cs_n <= cs_n_s;
	gene_conv	: process(clk_in) is
		variable count	: natural range 0 to 50000;
	begin
		if (clk_in'event and clk_in = '1') then
			count := count + 1;
			end if;
		if (count >= 50000) then
			cs_n_s <= '0';
			count := 0;
		else
			cs_n_s <= '1';
			end if;
	end process gene_conv;

	process(clk_in, fin_c)
	--here you manage the changes of state machine
		variable sampling : integer range 0 to 4;
	begin
		case state is
			when s0=>
			--do nothing state
				if (cs_n_s = '0') then
					state <= s1;
					sampling := 0;
				else
					state <= s0;
					end if;
			when s1=>
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
				if (fin_c = '1') then
					state <= s0;
				end if;
		end case;
	end process;
	

	process(state)
	--here you manage the outputs of state machine
	begin
		case state is
			when s0=>
			--do nothing state
				enable <= '0';
			when s1=>
			--save data state
				enable <= '0';
			when s2=>
			--show data state
				enable <= '1';
		end case;
	end process;
end rtl;

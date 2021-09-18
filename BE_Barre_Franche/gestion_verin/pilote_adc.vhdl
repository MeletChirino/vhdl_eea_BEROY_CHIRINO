--state machine that handles adc
library	ieee;
use	ieee.std_logic_unsigned.all;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity pilote_adc is
	port(
		cs_n	: in std_logic;
		counter	: in std_logic_vector(3 downto 0);
		enable	: out std_logic
	);
end entity;

architecture rtl of pilote_adc is
	type state_type is (s0, s1);
	signal state	: state_type;
begin
	process(cs_n, counter)
	--here you manage the changes of state machine
	begin
		case state is
			when s0=>
			--do nothing state
				if (cs_n'event and cs_n = '1') then
					state <= s1;
				end if;
			when s1=>
			--save data state
				if (counter = x"c") then
					state <= s0;
				end if;
		end case;
	end process;
	

	process(state)
	--here you manage the output of state machine
	begin
		case state is
			when s0=>
			--do nothing state
				enable <= '0';
			when s1=>
			--save data state
				enable <= '1';
		end case;
	end process;
end rtl;

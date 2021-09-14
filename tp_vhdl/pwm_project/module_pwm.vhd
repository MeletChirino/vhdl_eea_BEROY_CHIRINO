library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity module_pwm is
	port(
		clk_in		: in std_logic;
		freq		: in std_logic_vector(7 downto 0);
		duty_cycle	: in std_logic_vector(7 downto 0);
		pwm_out		: out std_logic
	    );
end entity;

architecture rtl of module_pwm is
	--signals
	signal counter : std_logic_vector(7 downto 0) := x"00";
begin
	counter_p : process(clk_in, counter) is
	begin
		if (clk_in'event and clk_in = '1') then
			counter <= counter + x"01";
		end if;

		if (counter > freq) then
			counter <= x"00";
		end if;

		if (counter < duty_cycle) then
			pwm_out <= '1';
		else 
			pwm_out <= '0';
		end if;
	end process counter_p;
end rtl;

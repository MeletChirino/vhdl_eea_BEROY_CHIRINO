library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pwm is
	port(
		clk_in		: in std_logic;
		pwm_out		: out std_logic
	    );
end entity;

architecture rtl of pwm is
	--signals
	signal counter : integer := 0;
	signal pwm_out2 : std_logic;
	signal freq		: integer := 50000000;
	signal duty_cycle	: integer := 49999999;
begin
	counter_p : process(clk_in, counter) is
	begin
		if (clk_in'event and clk_in = '1') then
			counter <= counter + 1;
		end if;

		if (counter > freq) then
			counter <= 0;
		end if;

		if (counter < duty_cycle) then
			pwm_out2 <= '0';
		else 
			pwm_out2 <= '1';
		end if;
		
		pwm_out <= pwm_out2;
	end process counter_p;
end rtl;
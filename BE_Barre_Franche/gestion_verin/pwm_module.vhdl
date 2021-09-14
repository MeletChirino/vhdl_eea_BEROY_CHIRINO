library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity pwm_module is
	port(
		freq	: in std_logic_vector(15 downto 0);
		duty	: in std_logic_vector(15 downto 0);
		clk_in	: in std_logic;
		pwm	: out std_logic
	);
end entity;

architecture rtl of pwm_module is
	--signals
	signal counter		: std_logic_vector(15 downto 0) := x"0000";
begin
	increase_p : process(clk_in) is
	begin
		if(clk_in'event and clk_in = '1') then
			counter <= counter + x"0001";
		end if;
		if (counter > freq) then
			counter <= x"0000";
		end if;
		if (counter < duty) then 
			pwm <= '1';
		else
			pwm <= '0';
		end if;
	end process increase_p;

end rtl;

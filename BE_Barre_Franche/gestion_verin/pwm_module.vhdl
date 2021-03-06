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
		--raz
		--enable_pw
	);
end entity;

architecture rtl of pwm_module is
	--signals
	signal counter		: std_logic_vector(15 downto 0) := x"0000";
	signal duty_s		: std_logic_vector(15 downto 0);
	signal freq_s		: std_logic_vector(15 downto 0);
	signal pwm_s		: std_logic;
begin
	divide : process(clk_in) is
	begin
		if(clk_in'event and clk_in = '1') then
			counter <= counter + x"0001";
		end if;
		if (counter > freq) then
			counter <= x"0000";
		end if;
	end process divide;

	compare	: process(clk_in) is
	begin
		if (counter < duty) then 
			pwm_s <= '1';
		else
			pwm_s <= '0';
		end if;
	end process compare;
pwm <= pwm_s;

end rtl;

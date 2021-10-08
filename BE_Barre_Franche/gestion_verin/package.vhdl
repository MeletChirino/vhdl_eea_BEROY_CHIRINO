library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

package tools is

	component pwm_module is
		port(
			freq	: in std_logic_vector(15 downto 0);
			duty	: in std_logic_vector(15 downto 0);
			clk_in	: in std_logic;
			pwm	: out std_logic
		    );
	end component;
end tools;

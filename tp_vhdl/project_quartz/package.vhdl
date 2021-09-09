Library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

package tools is

	component counter is
		port(
			input	: in std_logic;
			C	: in std_logic;
			reset	: in std_logic;		
			output 	: out std_logic_vector(3 downto 0)
		    );
	end component;

	component bcd_7sg is
		port(
			bcd_input	: in std_logic_vector(3 downto 0);
			output_7seg	: out std_logic_vector(6 downto 0)
		);
	end component;
	component diviseur is
		port(
			clk		: in std_logic;
			clock_out	: out std_logic
		);
	end component;

end tools;

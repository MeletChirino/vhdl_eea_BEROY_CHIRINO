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
	component clk_1MHz is
		port(
			clk_in	: in std_logic;
			clk_out	: out std_logic
		    );
	end component;
	component shift_register is
		port(
			enable		: in std_logic;
			number		: in std_logic_vector(3 downto 0);
			data_in		: in std_logic;
			angle_barre	: out std_logic_vector(11 downto 0); 
			clk_in		: in std_logic := '0'
		);
	end component;
	component compt_front is
		port(
			clk_in		: in std_logic;
			enable		: in std_logic;
			counter		: out std_logic_vector(3 downto 0)
		    );
	end component;
	component pilote_adc is
		port(
			clk_in	: in std_logic;
			cs_n	: in std_logic;
			counter	: in std_logic_vector(3 downto 0);
			enable	: out std_logic
		    );
	end component;
	component gene_start_conv is
		port(
			clk_in		: in std_logic;
			cs_n		: out std_logic
		    );
	end component;
end tools;

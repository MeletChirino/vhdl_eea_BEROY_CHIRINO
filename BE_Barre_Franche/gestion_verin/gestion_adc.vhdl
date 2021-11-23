-- mcp3201 handler
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library	work;
use 	work.tools.all;

entity gestion_adc is
	port(
		-- INPUTS
		clk_in		: in std_logic;
		data_in		: in std_logic;
		--Raz ?
		-- OUTPUTS
		cs_n			: out std_logic;
		clk_adc		: out std_logic;
		angle_barre	: out std_logic_vector(11 downto 0)	
	);
end entity;

architecture rtl of gestion_adc is
	--test signals 
	signal clk 	: std_logic := '0';
	signal clk_adc_s	: std_logic := '0';
	signal data	: std_logic_vector(11 downto 0);
	signal cs_n_s	: std_logic;
	signal fin_c	: std_logic;
	signal angle	: std_logic_vector(11 downto 0);
begin
	u_clk_adc	: clk_1MHz port map (
			clk_in	=> clk_in,
			clk_out	=> clk_adc_s
			);
	reg_dec		: shift_register port map (
			data_in		=> data_in,
			angle_barre 	=> data,
			fin_c		=> fin_c,
			cs_n		=> cs_n_s,
			clk_in		=> clk_adc_s
			);
	machine_etat	: pilote_adc port map(
			clk_in		=> clk_adc_s,
			cs_n		=> cs_n_s,
			fin_c		=> fin_c
			);
	cs_n <= cs_n_s;
	clk_adc <= clk_adc_s;
	angle_barre <= data;


end rtl;

-- mcp3201 simulator
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
		cs_n		: out std_logic;
		clk_adc		: out std_logic;
		angle_barre	: out std_logic_vector(11 downto 0)	
	);
end entity;

architecture rtl of gestion_adc is
	signal clk_adc_s	: std_logic;
	signal enable		: std_logic;
	signal cs_n_s		: std_logic;
	signal number		: std_logic_vector(3 downto 0);
	signal angle_barre_s	: std_logic_vector(11 downto 0);
begin
	clk_1			: clk_1MHz port map(
				clk_in		=> clk_in,
				clk_out		=> clk_adc_s
				);
	rising_edge_c		: compt_front port map(
				clk_in		=> clk_adc_s,
				enable		=> enable,
				counter		=> number
				);
	start_conversion	: gene_start_conv port map(
				clk_in		=> clk_adc_s,
				cs_n		=> cs_n_s
				);
	state_machine		: pilote_adc port map(
				clk_in		=> clk_adc_s,
				cs_n		=> cs_n_s,
				counter		=> number,
				enable		=> enable
				);
	shift_register_p	: shift_register port map(
				enable		=> enable,
				number		=> number,
				data_in		=> data_in,
				angle_barre	=> angle_barre_s,
				clk_in		=> clk_adc_s
				);
	cs_n <= cs_n_s;
	clk_adc <= clk_adc_s;
	angle_barre <= angle_barre_s;


end test;

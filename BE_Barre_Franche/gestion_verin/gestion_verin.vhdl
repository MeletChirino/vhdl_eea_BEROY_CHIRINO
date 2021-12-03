-- Gestion verin component file
library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library work;
use	work.tools.all;

entity gestion_verin is
	port(
		-- INPUTS
		clk_50m		: in std_logic;
		write_data 	: in std_logic_vector(31 downto 0);
		write_n		: in std_logic;
		data_in		: in std_logic;
		address		: in std_logic_vector(2 downto 0);
		chip_select	: in std_logic;
		reset_n		: in std_logic;
		-- OUTPUTS
		clk_50		: out std_logic;
		cs_n			: out std_logic;
		read_data	: out std_logic_vector(31 downto 0);
		clk_adc		: out std_logic;
		out_pwm		: out std_logic;
		pwm_raw		: out std_logic;
		data_in_out	: out std_logic; --borrar produccion
		angle_barre	: out std_logic_vector(11 downto 0); --borrar en produccion
		out_sens		: out std_logic
	);
end entity;

architecture rtl of gestion_verin is
	signal pwm_raw_s	: std_logic;
	signal clk_adc_s	: std_logic;
	signal angle_barre_w	: std_logic_vector(11 downto 0);
	signal angle_barre_s	: std_logic_vector(11 downto 0);
	signal butee_d		: std_logic_vector(11 downto 0);
	signal butee_g		: std_logic_vector(11 downto 0);
	signal freq_s		: std_logic_vector(15 downto 0);
	signal duty_s		: std_logic_vector(15 downto 0);
	signal sens_s		: std_logic;
	signal out_pwm_s		: std_logic;
	signal enable_s		: std_logic;
	signal raz_s			:std_logic;
	signal fin_butees		:std_logic_vector(1 downto 0);
	begin
	u0	: sopc_v3	port map(
		address_external_connection_export		=> address,
		chip_select_external_connection_export => chip_select,
		angle_barre_external_connection_export => angle_barre_s,
		butee_d_external_connection_export		=> butee_d,
		butee_g_external_connection_export		=> butee_g,
		clk_clk											=> clk_50m,
		duty_external_connection_export			=> duty_s,
		frequency_external_connection_export	=> freq_s,
		write_data_external_connection_export	=> write_data,
		read_data_external_connection_export	=> read_data,
		write_n_external_connection_export		=> write_n,
		enable_external_connection_export		=> enable_s,
		raz_external_connection_export			=> raz_s,
		fin_butee_external_connection_export	=> fin_butees,
		sens_external_connection_export			=> sens_s
		 );	
	pwm_1	: pwm_module port map(
		freq		=> freq_s,
		duty		=> duty_s,
		clk_in		=> clk_50m,
		pwm		=> pwm_raw_s
		);
	adc_man	: gestion_adc port map(
		-- INPUTS
		clk_in	=> clk_50m,
		data_in	=>	data_in,
		--Raz ?
		-- OUTPUTS
		cs_n		=> cs_n,
		clk_adc	=> clk_adc_s,
		angle_barre => angle_barre_s
		);
	butees	: gestion_butees port map(
		pwm			=> pwm_raw_s,
		butee_g		=> butee_g,
		butee_d		=> butee_d,
		fin_course_g=> fin_butees(0),
		fin_course_d=> fin_butees(1),
		angle_barre	=> angle_barre_s,
		sens			=> sens_s,
		out_pwm		=> out_pwm_s,
		out_sens		=> out_sens
		);
				
	out_sens <= sens_s;
	out_pwm <= out_pwm_s;
	pwm_raw	<= pwm_raw_s;
	clk_adc <= clk_adc_s;
	angle_barre <= angle_barre_s;
	
	
end rtl;

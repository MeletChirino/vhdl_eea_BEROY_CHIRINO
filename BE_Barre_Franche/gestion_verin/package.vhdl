library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use 	ieee.numeric_std.all;

package tools is
	component sopc_v3 is
		port(
		angle_barre_external_connection_export : in  std_logic_vector(11 downto 0) := (others => '0'); -- angle_barre_external_connection.export
		butee_d_external_connection_export     : out std_logic_vector(11 downto 0);                    --     butee_d_external_connection.export
		butee_g_external_connection_export     : out std_logic_vector(11 downto 0);                    --     butee_g_external_connection.export
		clk_clk                                : in  std_logic                     := '0';             --                             clk.clk
		duty_external_connection_export        : out std_logic_vector(15 downto 0);                    --        duty_external_connection.export
		frequency_external_connection_export   : out std_logic_vector(15 downto 0);                    --   frequency_external_connection.export
		read_data_external_connection_export   : out std_logic_vector(31 downto 0);                    --   read_data_external_connection.export
		sens_external_connection_export        : out std_logic;                                        --        sens_external_connection.export
		write_data_external_connection_export  : in  std_logic_vector(31 downto 0) := (others => '0')  --  write_data_external_connection.export
			);
	end component;
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
	component gestion_adc is
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
	end component;
	component gestion_butees is
		port(
		--inputs
		pwm		: in std_logic;
		butee_g		: in std_logic_vector(11 downto 0);
		butee_d		: in std_logic_vector(11 downto 0);
		angle_barre	: in std_logic_vector(11 downto 0);
		sens		: in std_logic;
		--outputs
		out_pwm		: out std_logic;
		fin_course_g	: out std_logic;
		fin_course_d	: out std_logic;
		out_sens	: out std_logic
		);
	end component;
end tools;

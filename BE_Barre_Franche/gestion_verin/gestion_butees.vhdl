 -- End race comparer
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

entity gestion_butees is
	port(
		--inputs
		pwm		: in std_logic;
		butee_g		: in std_logic_vector(11 downto 0);
		butee_d		: in std_logic_vector(11 downto 0);
		angle_barre	: in std_logic_vector(11 downto 0);
		sens		: in std_logic;
		--outputs
		out_pwm		: out std_logic;
		out_sens	: out std_logic
	);
end entity;

architecture rtl of gestion_butees is
	signal pwm_s		: std_logic;
	signal sens_s		: std_logic;
begin
	check_left		: process(angle_barre) is
	begin
		--si va a la izquierda pero el angle barre
		--es igual o menor que el de butee que ponga
		--el pwm a 0
	end process check_left;

	check_right		: process(angle_barre) is
	begin
		--si va a la derecha pero el angle barre
		--es igual o menor que el de butee que ponga
		--el pwm a 0
	end process check_right;

	pwm_out <= pwm_s;
	sens_out <= sens_s;

end rtl;

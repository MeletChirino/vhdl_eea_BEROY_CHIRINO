--test bench  for gestion butees
library	ieee;
use	ieee.std_logic_1164.all;
use 	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library work;
use	work.tools.all;

entity gestion_butees_tb is
end entity;

architecture test of gestion_butees_tb is
	--test signals
	signal pwm_s		: std_logic;
	signal left_stop	: std_logic_vector(11 downto 0) := x"111";
	signal right_stop	: std_logic_vector(11 downto 0) := x"399";
	signal angle_barre	: std_logic_vector(11 downto 0) := x"000";
	signal sens_s		: std_logic := '0';
begin
	gestion_butees_p	: gestion_butees port map(
				pwm		=> pwm_s,
				butee_g		=> left_stop,
				butee_d		=> right_stop,
				angle_barre	=> angle_barre,
				sens		=> sens_s
				);
	pwm_gen			: process is
	begin
		for i in 0 to 2000 loop
			pwm_s <= '1';
			wait for 10 ns;
			pwm_s <= '0';
			wait for 10 ns;
			end loop;
		--comentario aleatorio
		end process pwm_gen;

	process is
	begin
		--going left
		sens_s <= '0';
		angle_barre <= x"342";
		for i in 0 to 1000 loop
			wait for 5 ns;
			angle_barre <= angle_barre - x"1";
			end loop;
		--going right
		sens_s <= '1';
		angle_barre <= x"000";
		for i in 0 to 1000 loop
			wait for 5 ns;
			angle_barre <= angle_barre + x"1";
			end loop;
	end process;

end test;

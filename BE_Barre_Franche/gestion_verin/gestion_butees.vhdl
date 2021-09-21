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
		fin_course_g	: out std_logic;
		fin_course_d	: out std_logic;
		out_sens	: out std_logic
	);
end entity;

architecture rtl of gestion_butees is
	signal pwm_s		: std_logic;
begin
	check			: process(angle_barre) is
	begin
		if(sens = '0') then
			if (angle_barre < butee_g) then
				pwm_s <= '0';
				fin_course_g <= '1';
			else
				pwm_s <= pwm;
				fin_course_g <= '0';
				end if;
		elsif(sens = '1') then
			if (angle_barre > butee_d) then
				pwm_s <= '0';
				fin_course_d <= '1';
			else
				pwm_s <= pwm;
				fin_course_d <= '0';
				end if;
			end if;	
	end process check;

	out_pwm <= pwm_s;
	out_sens <= sens;

end rtl;

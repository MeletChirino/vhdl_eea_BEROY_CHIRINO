Library	ieee; 
use	ieee.std_logic_1164.all; 
use 	ieee.std_logic_unsigned.all; 
use 	ieee.numeric_std.all; 

entity module_pwm_tb is 
end entity;

architecture test of module_pwm_tb is 
	component module_pwm
		port( 
			clk_in		: in std_logic;
			freq		: in std_logic_vector(7 downto 0);
			duty_cycle	: in std_logic_vector(7 downto 0);
			pwm_out		: out std_logic
		);
	end component;
	signal freq		: std_logic_vector(7 downto 0) := x"ff";
	signal duty_cycle	: std_logic_vector(7 downto 0) := x"88";
	signal clk_in		: std_logic := '0';
begin
	simulation : module_pwm port map(
		--puerto externo => senhal local
		clk_in		=> clk_in,
		freq		=> freq,
		duty_cycle	=> duty_cycle
	);

	process begin
		wait for 10 ns;
		for i in 0 to 1024 loop
			wait for 10 ns;
			clk_in <= not clk_in;
		end loop;
		
	end process;
end test;

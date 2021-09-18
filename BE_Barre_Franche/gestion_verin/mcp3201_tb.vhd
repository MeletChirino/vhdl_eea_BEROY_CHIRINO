-- mcp3201 simulator
library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

--my components
library	work;
use 	work.tools.all;

entity mcp3201_tb is
end entity;

architecture test of mcp3201_tb is
	signal clk_50		: std_logic := '0';
	signal clk_adc		: std_logic;
	signal enable		: std_logic := '0';
	signal cs_n		: std_logic;
	signal number		: std_logic_vector(3 downto 0);
	signal angle_barre	: std_logic_vector(11 downto 0);
	--internal signals
	signal data_in		: std_logic := '1';
	signal data		: std_logic_vector(11 downto 0) := x"9b9";
	signal j		: integer := 0;
	signal clk_conv		: std_logic := '0';
	signal counter		: integer := 0;
begin
	clk_1			: clk_1MHz port map(
				clk_in		=> clk_50,
				clk_out		=> clk_adc
				);
	rising_edge_c		: compt_front port map(
				clk_in		=> clk_adc,
				enable		=> enable,
				counter		=> number
				);
	start_conversion	: gene_start_conv port map(
				clk_in		=> clk_adc,
				cs_n		=> cs_n
				);
	state_machine		: pilote_adc port map(
				clk_in		=> clk_adc,
				cs_n		=> cs_n,
				counter		=> number,
				enable		=> enable
				);
	shift_register_p	: shift_register port map(
				enable		=> enable,
				number		=> number,
				data_in		=> data_in,
				angle_barre	=> angle_barre,
				clk_in		=> clk_adc
				);

	clk_50MHz		: process is
	begin
		for i in 0 to 400000 loop
			wait for 10 ns;
			clk_50 <= '1';
			wait for 10 ns;
			clk_50 <= '0';
		end loop;
	end process clk_50MHz;

	send_data		: process(clk_adc, enable) is
	begin
		if(clk_adc'event and clk_adc='0' and enable = '1') then
			clk_conv <= not(clk_conv);
			data_in <= data(j);
			j <= j + 1;
		end if;
			if(j = 11) then
				j <= 0;
			end if;
	end process send_data;

end test;

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
	signal data_in		: std_logic;
	signal data		: std_logic_vector(11 downto 0) := x"abc";
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
				cs_n		=> cs_n,
				counter		=> number,
				enable		=> enable
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

	--clk_50MHz --> clk_1MHz
	--clk_1Mhz --> re_counter
	--clk_1MHz --> cs_m
	--clk_1MHz --> shiftreg : clk_adc
	--recounter --> shiftreg
	--re_counter --> state machine : counter
	--state machine --> re counter : enable
	--state machine --> shiftreg : enable
	--csn --> state machine : csn
	
	--********* local data ***********
	--csn --> here
	-- here --> shift reg
	-- clk_adc --> here


end test;

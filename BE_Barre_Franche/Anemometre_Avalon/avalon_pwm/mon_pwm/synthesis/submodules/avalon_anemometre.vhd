library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.std_logic_unsigned.all;
use	ieee.numeric_std.all;

library	work;
use 	work.tools.all;

entity avalon_anemometre is
	port(
		clk, chipselect, write_n, reset_n : in std_logic;
		writedata : in std_logic_vector (31 downto 0);
		readdata : out std_logic_vector (31 downto 0);
		address: std_logic_vector (1 downto 0);
		in_freq_anemometre : in std_logic
	);
end entity;

architecture rtl of avalon_anemometre is      
	
	signal enable_1Hz	: std_logic;
	signal time_1Hz	: std_logic;
	signal time_pwm	: std_logic;
	signal freq_temp  : std_logic_vector(7 downto 0);
	------------------------- avalon
	--signal raz_n  : std_logic;
	signal continu  : std_logic;
	signal start_stop  : std_logic;
	signal data_valid : std_logic;
	signal data_anemometre : std_logic_vector(7 downto 0);
	
begin
--senhal externa => senhal interna

	diviseur	: time_divider port map (
			clk_in		=> clk,
			clock_1Hz	=> time_1Hz,
			end_o  => enable_1Hz
			);
			
	acumulateur	: counter port map(
			clk_1Hz => time_1Hz,
			rst => reset_n,
			in_freq_anemo => in_freq_anemometre,
			freq_out => freq_temp
			); 
	
	mode	: select_mode port map (
			clk_1Hz => time_1Hz,
			freq_anem_in => freq_temp,
			freq_anem_out => data_anemometre,
			mode_continu => continu,
			signal_start_stop => start_stop,
			signal_data_valid => data_valid
			);
	
---- écriture registres
	process_write: process (clk, reset_n)
	begin
	if reset_n = '0' then
	continu <= '0'; 
	elsif clk'event and clk = '1' then
	if chipselect ='1' and write_n = '0' then
	if address = "00" then
	continu <= writedata(1);
	end if;
	end if;
	end if;
	end process;

---- lecture registres
	process_Read: PROCESS(address, freq_temp)
	BEGIN

	case address is
	when "01" => readdata <= X"00000"&"0000"&freq_temp;
	when others => readdata <= (others => '0');
	end case;

	END PROCESS process_Read ;


end rtl;


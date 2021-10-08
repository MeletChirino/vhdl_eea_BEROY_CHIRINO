library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity select_mode is
	port(
		clk_1Hz: in std_logic;
		mode_continu: in std_logic;
		signal_start_stop: in std_logic;
		freq_anem_in	: in std_logic_vector(7 downto 0);
		signal_data_valid: out std_logic;
		freq_anem_out	: out std_logic_vector(7 downto 0)
	    );
end entity;

architecture rtl of select_mode is
	--signals
	signal freq_anemo : std_logic_vector(7 downto 0); 

begin
continu: process(clk_1Hz) is
	begin

	if mode_continu = '1' then
		if rising_edge(clk_1Hz) then
			freq_anem_out <= freq_anem_in;
			signal_data_valid <= '1';
      end if;	
	elsif mode_continu = '0' and signal_start_stop = '0' then
		freq_anemo <= freq_anem_in;
		signal_data_valid <= '0';
	elsif mode_continu = '0' and signal_start_stop = '1' then
		freq_anem_out <= freq_anemo;
		signal_data_valid <= '1';
	end if;

end process continu;
	
end rtl;
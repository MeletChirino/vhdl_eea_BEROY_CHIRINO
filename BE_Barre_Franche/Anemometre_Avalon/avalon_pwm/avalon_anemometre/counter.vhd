library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
Use ieee.std_logic_arith.all;

entity counter is
	port ( 
			clk_1Hz: in std_logic;
			in_freq_anemo: in std_logic;
			rst: in std_logic;
			freq_out: out std_logic_vector(7 downto 0)
		 );
end counter;

architecture calcul_freq_anemo of counter is
	signal count_freq: STD_logic_vector(7 downto 0)	:= x"00";
	signal freq_vecteur : std_logic_vector(7 downto 0);
	

BEGIN 
count: process(clk_1Hz, in_freq_anemo)

	begin
	if rst = '0' then
		count_freq <= x"00"; 
		
	elsif clk_1Hz = '1' and rst = '1' then 
		if rising_edge(in_freq_anemo) then 
			count_freq <= count_freq + x"01"; 
		end if;
	
	elsif clk_1Hz = '0' and rst = '1' then 
			count_freq <= x"00";
			
	end if;
	
	end process count;
	
reset: process(clk_1Hz)
	begin
		if falling_edge(clk_1Hz) then  
			freq_out <= count_freq + count_freq;
		end if;
	
	end process reset;

	
end calcul_freq_anemo;
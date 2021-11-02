library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity time_divider is
	port ( 
		   clk_in: in std_logic;
		   clock_1Hz: out std_logic;
			end_o   : out std_logic
		 );
end time_divider;

architecture comportement_clk of time_divider is
	signal count: std_logic_vector(24 downto 0)	:= '0'& x"000000";
	signal bascule : std_logic 	:= '0';
	signal control : std_logic 	:= '0';

begin
     process(clk_in)
     begin
		if(clk_in'event and clk_in='1') then
			count <= count + ('0'& x"000001");
			control <= '0';
			if (count = x"17D7840") then
				bascule <= not bascule ; 
				count <= '0'& x"000000"; --reset clock
				control <= '1';
			end if;
		end if;
	end process;
	clock_1Hz <= bascule;
	end_o <= '1' when (count = x"17D7840") else '0';
  
end comportement_clk;

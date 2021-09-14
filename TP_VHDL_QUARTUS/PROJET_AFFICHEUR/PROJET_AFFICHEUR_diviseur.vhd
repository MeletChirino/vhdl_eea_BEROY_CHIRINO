<<<<<<< HEAD
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Diviseur is
	port ( 
		   clk: in std_logic;
		   clock_out: out std_logic
		 );
end Diviseur;

architecture comportement_clk of Diviseur is
	signal count: integer:=1;
	signal bascule : std_logic := '0';

begin
     process(clk)
     begin
		if(clk'event and clk='1') then
			count <=count+1;
			
		if (count = 25000000) then
			bascule <= NOT bascule; 
			count <= 1; --reset clock
		end if;
		end if;
	clock_out <= bascule;
	end process;
  
end comportement_clk;



  



  
=======
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Clock_Divider is
	port ( 
		   clk: in std_logic;
		   clock_out: out std_logic
		 );
end Clock_Divider;

architecture bhv of Clock_Divider is
	signal count: integer:=1;
	signal tmp : std_logic := '0';

begin
     process(clk)
     begin
		if(clk'event and clk='1') then
			count <=count+1;
			
		if (count = 25000000) then
			tmp <= NOT tmp;
			count <= 1;
		end if;
		end if;
	clock_out <= tmp;
	end process;
  
end bhv;



  



  
>>>>>>> 73f3557e2a5cad6f746a62e78793368586ece728

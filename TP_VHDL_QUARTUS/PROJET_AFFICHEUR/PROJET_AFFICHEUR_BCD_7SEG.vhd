<<<<<<< HEAD
library ieee;
use ieee.std_logic_1164.all;

library	work;
use	work.bcd_7segments;
use	work.counter;

entity PROJET_AFFICHEUR is
	port(
		input	: in std_logic;
		reset   : in std_logic;
		c       : in std_logic;
		output	: out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of PROJET_AFFICHEUR is

component counter
		port( 
			input_counter	: in std_logic;
		    C	: in std_logic;
		    reset	: in std_logic;		
		    output_counter 	: out std_logic_vector(3 downto 0)
		);
end component;

component bcd_7sg
		port(
		input_7sg	: in std_logic_vector(3 downto 0);
		output_7sg	: out std_logic_vector(6 downto 0)
		    );
end component;
	
begin


	
=======
library ieee;
use ieee.std_logic_1164.all;

library	work;
use	work.bcd_7segments;
use	work.counter;

entity PROJET_AFFICHEUR is
	port(
		input	: in std_logic;
		reset   : in std_logic;
		c       : in std_logic;
		output	: out std_logic_vector(6 downto 0)
	);
end entity;

architecture rtl of PROJET_AFFICHEUR is

component counter
		port( 
			input_counter	: in std_logic;
		    C	: in std_logic;
		    reset	: in std_logic;		
		    output_counter 	: out std_logic_vector(3 downto 0)
		);
end component;

component bcd_7sg
		port(
		input_7sg	: in std_logic_vector(3 downto 0);
		output_7sg	: out std_logic_vector(6 downto 0)
		    );
end component;
	
begin


	
>>>>>>> 73f3557e2a5cad6f746a62e78793368586ece728
end rtl;
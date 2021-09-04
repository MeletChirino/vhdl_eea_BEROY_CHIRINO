library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity adder_2x5 is
	port(
		num1, num2	: in std_logic_vector(4 downto 0);
		s		: out std_logic_vector(4 downto 0);
		cin		: in std_logic;
		cout		: out std_logic
	);
end entity;

architecture behavior of adder_2x5 is
	signal resultat		: std_logic_vector(5 downto 0);
begin 
	--esto es lo que funciona
	resultat <= ('0' & num1) +
		    ('0' & num2) +
		    ("00000" & cin);

	s <= resultat(4 downto 0);
	cout <= resultat(5);
end behavior;

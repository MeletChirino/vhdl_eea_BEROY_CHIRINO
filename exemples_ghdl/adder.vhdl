library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port (
		i1, i2, ci	: in std_logic;
		o, co		: out std_logic
	);
end adder;
architecture behavior of adder is
begin
	o <= (not i1 and not i2 and ci) or
	     (not i1 and i2 and not ci) or
	     (i1 and not i2 and not ci) or
	     (i1 and i2 and ci);
	co <= (i2 and ci and not ci) or 
	      (i1 and ci and not i2) or
	      (i1 and i2 and not ci) or
	      (i1 and i2 and ci);
end behavior;


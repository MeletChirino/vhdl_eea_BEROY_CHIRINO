library ieee;
use ieee.std_logic_1164.all;

entity adder_tb is
end adder_tb;

architecture test of adder_tb is
	component adder
		port (
			i1, i2, ci	: in std_logic;
			o, co		: out std_logic
		);
	end component;
	signal i1, i2, ci, o, co : std_logic;
begin
	adder_1 : adder port map (
		i1 => i1,
		i2 => i2,
		ci => ci,
		o => o,
		co => co
	);
	process begin
		i1 <= 'X';
		i2 <= 'X';
		ci <= 'X';
		wait for 1 ns;

		i1 <= '0';
		i2 <= '0';
		ci <= '0';
		wait for 1 ns;

		i1 <= '1';
		i2 <= '0';
		ci <= '1';
		wait for 1 ns;

		i1 <= '0';
		i2 <= '1';
		ci <= '1';
		wait for 1 ns;

		i1 <= '1';
		i2 <= '1';
		ci <= '1';
		wait for 1 ns;

		assert false report "end";
		wait;

	end process;
end test;

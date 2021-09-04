library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity adder_2x5_tb is
end entity;

architecture test of adder_2x5_tb is
	component adder_2x5
		port(
			num1, num2	: in std_logic_vector(4 downto 0);
			s		: out std_logic_vector(4 downto 0);
			cin		: in std_logic;
			cout		: out std_logic
		);
	end component;
	signal num1, num2, s	: std_logic_vector(4 downto 0):= "00001";
	signal cin		: std_logic:= '0';
	signal cout		: std_logic;
begin
	--instance of 2X5 adder
	adder_1 : adder_2x5 port map(
		num1 	=> num1,
		num2	=> num2,
		s 	=> s,
		cin 	=> cin,
		cout 	=> cout
	);
	--comenzando proceso como tal
	process begin
		
		for i in num1'left downto num1'right loop
			num1(i) <= '1';
			num2(i) <= '1';
			wait for 1 ns;
		end loop;
		--assert false report "end";
		wait;

	end process;	

end test;

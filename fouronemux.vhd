LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY fouronemux IS
PORT(
	p0 : IN STD_LOGIC;
	p1 : IN STD_LOGIC;
	p2 : IN STD_LOGIC;
	p3 : IN STD_LOGIC;
	s0 : IN STD_LOGIC;
	s1 : IN STD_LOGIC;
	f : OUT STD_LOGIC);
END fouronemux;

architecture rtl of fouronemux is
SIGNAL int_a, int_b : STD_LOGIC; 
COMPONENT twoonemux
	PORT(
		p0 : IN STD_LOGIC;
		p1 : IN STD_LOGIC;
		s : IN STD_LOGIC;
		f : OUT STD_LOGIC);
	END COMPONENT;
begin
	muxA: twoonemux
	PORT MAP(
		p0 => p0,
		p1 => p1,
		s => s0,
		f => int_a
	);
	muxB: twoonemux
	PORT MAP(
		p0 => p2,
		p1 => p3,
		s => s0,
		f => int_b
	);
	muxC: twoonemux
	PORT MAP(
		p0 => int_a,
		p1 => int_b,
		s => s1,
		f => f
	);
end rtl;
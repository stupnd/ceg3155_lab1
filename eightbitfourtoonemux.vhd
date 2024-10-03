LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY eightbitfourtoonemux IS
PORT(
	p0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	p1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	p2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	p3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	s0 : IN STD_LOGIC;
	s1 : IN STD_LOGIC;
	f : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END eightbitfourtoonemux;

architecture rtl of eightbitfourtoonemux is
SIGNAL int_a, int_b : STD_LOGIC_VECTOR(7 DOWNTO 0); 
COMPONENT eightbittwotoonemux
	PORT(
		w0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		w1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		s : IN STD_LOGIC;
		f : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
begin
	muxA: eightbittpotoonemux
	PORT MAP(
		p0 => p0,
		p1 => p1,
		s => s0,
		f => int_a
	);
	muxB: eightbittwotoonemux
	PORT MAP(
		p0 => p2,
		p1 => p3,
		s => s0,
		f => int_b
	);
	muxC: eightbittwotoonemux
	PORT MAP(
		p0 => int_a,
		p1 => int_b,
		s => s1,
		f => f
	);
end rtl;
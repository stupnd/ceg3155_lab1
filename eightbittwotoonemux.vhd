LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY eightbittwotoonemux IS
PORT(
	p0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	p1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	s : IN STD_LOGIC;
	f : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END eightbittwotoonemux;

architecture rtl of eightbittwotoonemux is
SIGNAL int_t1, int_t2 : STD_LOGIC_VECTOR(7 DOWNTO 0); 
begin
	
	int_t1(0) <= p0(0) and not s;
	int_t2(0) <= p1(0) and s;
	
	int_t1(1) <= p0(1) and not s;
	int_t2(1) <= p1(1) and s;
	
	int_t1(2) <= p0(2) and not s;
	int_t2(2) <= p1(2) and s;
	
	int_t1(3) <= p0(3) and not s;
	int_t2(3) <= p1(3) and s;
	
	int_t1(4) <= p0(4) and not s;
	int_t2(4) <= p1(4) and s;
	
	int_t1(5) <= p0(5) and not s;
	int_t2(5) <= p1(5) and s;
	
	int_t1(6) <= p0(6) and not s;
	int_t2(6) <= p1(6) and s;
	
	int_t1(7) <= p0(7) and not s;
	int_t2(7) <= p1(7) and s;

	f <= int_t1 or int_t2;
end rtl;
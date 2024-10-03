LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY twoonemux IS
PORT(
	p0 : IN STD_LOGIC;
	p1 : IN STD_LOGIC;
	s : IN STD_LOGIC;
	f : OUT STD_LOGIC);
END twoonemux;

architecture rtl of twoonemux is
SIGNAL int_t1, int_t2 : STD_LOGIC; 
begin
	int_t1 <= p0 and not s;
	int_t2 <= p1 and s;
	
	f <= int_t1 or int_t2;
end rtl;
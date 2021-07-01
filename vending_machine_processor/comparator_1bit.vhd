-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  comparator_1bit- structural 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity comparator_1bit is
	port(
		a : in std_logic;
		b : in std_logic;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic);
end comparator_1bit;
	
architecture structural of comparator_1bit is
begin
	g <= (a and (not b));
	e <= (a xnor b);
	l <= ((not a) and b);
end structural;
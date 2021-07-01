-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  comparator_CO: comparator_consider_order - structural 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity comparator_CO is  --comparator_consider_order
	port(
		g_old : in std_logic;
		e_old : in std_logic;
		l_old : in std_logic;
		a : in std_logic;
		b : in std_logic;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic);
end comparator_CO;
	
architecture structural  of comparator_CO is
begin
	g <= (a and (not b) and e_old) or g_old;
	e <= (a xnor b) and e_old;
	l <= ((not a) and b and e_old) or l_old;
end structural ;
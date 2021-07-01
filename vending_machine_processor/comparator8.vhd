-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  comparator8- structural 
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity comparator8 is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		g_out : out std_logic;
		e_out : out std_logic;
		l_out : out std_logic);
end comparator8;
	
architecture structural of comparator8 is
	signal g : std_logic_vector(7 downto 0);
	signal e : std_logic_vector(7 downto 0);
	signal l : std_logic_vector(7 downto 0);

	component comparator_1bit
	port(
		a : in std_logic;
		b : in std_logic;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic);
	end component;

	component comparator_CO  --comparator_consider_order
	port(
		g_old : in std_logic;
		e_old : in std_logic;
		l_old : in std_logic;
		a : in std_logic;
		b : in std_logic;
		g : out std_logic;
		e : out std_logic;
		l : out std_logic);
	end component;

begin	
	bit7 : comparator_1bit port map (a(7), b(7), g(6), e(6), l(6));
	bit6 : comparator_CO port map (g(6), e(6), l(6), a(6), b(6), g(5), e(5), l(5));
	bit5 : comparator_CO port map (g(5), e(5), l(5), a(5), b(5), g(4), e(4), l(4));
	bit4 : comparator_CO port map (g(4), e(4), l(4), a(4), b(4), g(3), e(3), l(3));
	bit3 : comparator_CO port map (g(3), e(3), l(3), a(3), b(3), g(2), e(2), l(2));
	bit2 : comparator_CO port map (g(2), e(2), l(2), a(2), b(2), g(1), e(1), l(1));
	bit1 : comparator_CO port map (g(1), e(1), l(1), a(1), b(1), g(0), e(0), l(0));
	bit0 : comparator_CO port map (g(0), e(0), l(0), a(0), b(0), g_out, e_out, l_out);
	
end structural;
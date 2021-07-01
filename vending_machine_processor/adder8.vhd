-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  Adder8
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

ENTITY adder8 IS
  PORT(
	a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector(7 downto 0);
	c_in: in std_logic;
	s: out std_logic_vector(7 downto 0);
	c_out: out std_logic);
end adder8;

architecture model of adder8 is
signal c: std_logic_vector(7 downto 1) := (others => '0');
	COMPONENT full_adder
	  PORT(
		 a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 c_in : IN STD_LOGIC;
		 sum : OUT STD_LOGIC;
		 c_out : OUT STD_LOGIC);
	END COMPONENT;
BEGIN
	bit0 : full_adder PORT MAP (a(0),b(0),c_in,s(0),c(1));
	bit1 : full_adder PORT MAP (a(1),b(1),c(1),s(1),c(2));
	bit2 : full_adder PORT MAP (a(2),b(2),c(2),s(2),c(3));
	bit3 : full_adder PORT MAP (a(3),b(3),c(3),s(3),c(4));
	bit4 : full_adder PORT MAP (a(4),b(4),c(4),s(4),c(5));
	bit5 : full_adder PORT MAP (a(5),b(5),c(5),s(5),c(6));
	bit6 : full_adder PORT MAP (a(6),b(6),c(6),s(6),c(7));
	bit7 : full_adder PORT MAP (a(7),b(7),c(7),s(7),c_out);
END model;

-- Engineer: Mohammad Niknam
-- Project Name: vending_machine_processor
-- Module Name:  mux21
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity mux21 is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		s : in std_logic;
		output : out std_logic_vector(7 downto 0)
		);
end mux21;

architecture model of mux21 is 
begin
	output <= A when (s = '0') else
				 B when (s = '1');
end model;
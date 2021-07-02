-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  subtractor8 - structural
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity subtractor8 is
	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		result : out std_logic_vector(7 downto 0)
		);
end subtractor8;

architecture structural of subtractor8 is
component adder8 IS
  port(
	a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector(7 downto 0);
	c_in: in std_logic;
	s: out std_logic_vector(7 downto 0);
	c_out: out std_logic
	);
end component;

signal c_in : std_logic;
signal c_out : std_logic;
signal not_b : std_logic_vector(7 downto 0);

begin
	not_b <= (not b);
	c_in <= '1';
	subtractor : adder8 port map (a, not_b, c_in, result, c_out);
end structural;

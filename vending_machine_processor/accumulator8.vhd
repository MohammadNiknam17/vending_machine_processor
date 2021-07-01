-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  accumulator8
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity accumulator8 is
	port(
		clk : in std_logic;
		reset_acc : in std_logic;
		data_in : in std_logic_vector(7 downto 0);
		data_out : out std_logic_vector(7 downto 0)
		);
end accumulator8;

architecture rtl of accumulator8 is
component adder8 IS
  port(
	a : in std_logic_vector(7 downto 0);
	b : in std_logic_vector(7 downto 0);
	c_in: in std_logic;
	s: out std_logic_vector(7 downto 0);
	c_out: out std_logic
	);
end component;

component register8 is
	port(
	 clk: in std_logic;
	 nRST : in std_logic;
	 regin : in std_logic_vector(7 downto 0);	
	 regout : out std_logic_vector(7 downto 0)
	);
end component;


signal temp1 : std_logic_vector(7 downto 0);
signal temp2 : std_logic_vector(7 downto 0);
signal c_in : std_logic;
signal c_out : std_logic;

begin
	adder8 : adder8 port map (data_in, temp2, c_in, temp1, c_out);
	reg8 : register8 port map (clk, reset_acc, temp1, temp2);
	data_out <= temp2;
end rtl;

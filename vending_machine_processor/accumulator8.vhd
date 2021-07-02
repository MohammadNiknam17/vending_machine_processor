-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  accumulator8
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity accumulator8 is
	port(
		clk : in std_logic;
		nRST_acc : in std_logic;
		C : in std_logic;	--becomes 1 when a coin is detected.
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

signal temp1 : std_logic_vector(7 downto 0);
signal temp2 : std_logic_vector(7 downto 0);
signal c_in : std_logic;
signal c_out : std_logic;

begin
	c_in <= '0';
	
	adder : adder8 port map (data_in, temp2, c_in, temp1, c_out);

	reg: process(clk)
	begin
		if (clk'event and clk = '1') then
			if nRST_acc = '0' then
				temp2 <= (others => '0');
			elsif (C = '1') then
				temp2 <= temp1;
			end if;
		end if;
	end process reg;

	data_out <= temp2;
end rtl;

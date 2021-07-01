-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  register8
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity register8 is
	port(
		clk: in std_logic;
		nRST : in std_logic;
		regin : in std_logic_vector(7 downto 0);
		regout : out std_logic_vector(7 downto 0)
		);
end register8;

architecture rtl of register8 is
begin
	process(clk, reset)
	begin 
		if (CLK'event and CLK = '1') then
			if(nRST = '0') then
				regout <= "00000000";
			else
				regout <= regin;
			end if;
		end if;
	end process;
end rtl;
			

-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  vending_machine_TB
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
 
ENTITY vending_machine_TB IS
END vending_machine_TB;
 
ARCHITECTURE behavior OF vending_machine_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vending_machine
    PORT(
         nRST : IN  std_logic;
         clk : IN  std_logic;
         C : IN  std_logic;
         V : IN  std_logic_vector(7 downto 0);
         S0 : IN  std_logic_vector(7 downto 0);
         S1 : IN  std_logic_vector(7 downto 0);
         choice : IN  std_logic;
         P : OUT  std_logic_vector(7 downto 0);
         E : OUT  std_logic_vector(7 downto 0);
         D : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal nRST : std_logic := '0';
   signal clk : std_logic := '0';
   signal C : std_logic := '0';
   signal V : std_logic_vector(7 downto 0) := (others => '0');
   signal S0 : std_logic_vector(7 downto 0) := (others => '0');
   signal S1 : std_logic_vector(7 downto 0) := (others => '0');
   signal choice : std_logic := '0';

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
   signal E : std_logic_vector(7 downto 0);
   signal D : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vending_machine PORT MAP (
          nRST => nRST,
          clk => clk,
          C => C,
          V => V,
          S0 => S0,
          S1 => S1,
          choice => choice,
          P => P,
          E => E,
          D => D
        );

   CLK <= not(CLK) after CLK_TIME;
   nRST <= '0', '1' after 400 ns;  -- hold reset state for 400 ns.
   
   

END;

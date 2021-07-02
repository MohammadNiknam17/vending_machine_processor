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
 
   constant S0price : std_logic_vector(7 downto 0) := "00100001"; --soda S0 price= 33 cent
   constant S1price : std_logic_vector(7 downto 0) := "01000001"; --soda S1 price= 65 cent
   
   constant Nickel : std_logic_vector(7 downto 0) := "00000101"; --us_coin value= 5 cent
   constant Dime : std_logic_vector(7 downto 0) := "00001010"; --us_coin value= 10 cent
   constant Quarter : std_logic_vector(7 downto 0) := "00011001"; --us_coin value= 25 cent


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

   CLK <= not(CLK) after clk_period/2;
   nRST <= '0', '1' after 150 ns;  -- hold reset state for 400 ns.
   s0 <= S0price; --soda S0 price= 33 cent
   S1 <= S1price; --soda S1 price= 65 cent
   choice <= '1', '0' after 700 ns;
   C <= '0', '1' after 300 ns, '0' after 310 ns, '1'after 350ns, '0' after 360 ns,
             '1' after 400 ns, '0' after 410 ns, '1'after 450ns, '0' after 460 ns,
             '1' after 700 ns, '0' after 710 ns, '1'after 750ns, '0' after 760 ns,
             '1' after 800 ns, '0' after 810 ns;
   
   v <= (others => '0'), Quarter after 290 ns, Nickel after 340 ns, Dime after 400 ns, Quarter after 440 ns,
   Quarter after 700 ns, Nickel after 750 ns, Dime after 800 ns, (others => '0') after 810 ns;
END;

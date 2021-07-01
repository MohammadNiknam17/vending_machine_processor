-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  full_adder
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

ENTITY full_adder IS
  PORT(
    a : IN STD_LOGIC;
    b : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    sum : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC);
END full_adder;

ARCHITECTURE model OF full_adder IS
BEGIN
 sum <= a XOR b XOR c_in;
 c_out <= (a AND b) OR (c_in AND (a XOR b));
END model;

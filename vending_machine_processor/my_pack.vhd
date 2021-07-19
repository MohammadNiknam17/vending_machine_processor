-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  my_pack

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package my_pack is
    
    function mux21 (
        signal A, B : std_logic_vector(7 downto 0);
        signal s : std_logic)
        return std_logic_vector;
    
    
    procedure register8
        (signal	clk : in std_logic;
        signal nRST : in std_logic;
        signal regin : in std_logic_vector(7 downto 0);
        signal regout : out std_logic_vector(7 downto 0));
    
end my_pack;
------------------------------------------------------------------------
package body my_pack is

    function mux21 (
        signal A, B : std_logic_vector(7 downto 0);
        signal s : std_logic)
        return std_logic_vector is
            variable output : std_logic_vector(7 downto 0);
            begin
                case s is
                    when '0' => output := A;
                    when others => output := B;
                end case ;
                return output;
    end mux21;


    procedure register8 
        (signal	clk : in std_logic;
        signal nRST : in std_logic;
        signal regin : in std_logic_vector(7 downto 0);
        signal regout : out std_logic_vector(7 downto 0)) is
            begin
                if (CLK'event and CLK = '1') then
                    if(nRST = '0') then
                        regout <= "00000000";
                    else
                        regout <= regin;
                    end if;
                end if;
    end register8;
    
end my_pack;
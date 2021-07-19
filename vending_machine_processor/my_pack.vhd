-- Engineer: Mohammad Niknam
-- Project Name:  vending_machine_processor
-- Module Name:  my_pack

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package my_pack is
    
    function mux21(
        signal A, B : std_logic_vector(7 downto 0);
        signal s : std_logic)
        return std_logic_vector;
    

    function subtractor8(
        signal A, B : std_logic_vector(7 downto 0))
        return std_logic_vector;

    procedure comparator8(
        signal a, b : in std_logic_vector(7 downto 0);
        signal g_out, e_out, l_out : out std_logic);

    
    procedure register8(
        signal	clk : in std_logic;
        signal nRST : in std_logic;
        signal regin : in std_logic_vector(7 downto 0);
        signal regout : out std_logic_vector(7 downto 0));
    
end my_pack;
------------------------------------------------------------------------
package body my_pack is

    function mux21(
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


    function subtractor8(
        signal A, B : std_logic_vector(7 downto 0))
        return std_logic_vector is
            variable Avar, Bvar : unsigned(7 downto 0);
            variable result : std_logic_vector(7 downto 0);
        begin
            Avar := unsigned(A);
            Bvar := unsigned(B);
            Bvar := not(Bvar) + "00000001";
            result := std_logic_vector(Avar + Bvar);
            return result;
        end subtractor8;


    procedure comparator8(
        signal a, b : in std_logic_vector(7 downto 0);
        signal g_out, e_out, l_out : out std_logic) is
            begin
                if (a > b) then
                    g_out <= '1';
                    e_out <= '0';
                    l_out <= '0';
                elsif (a = b) then
                    g_out <= '0';
                    e_out <= '1';
                    l_out <= '0';
                else
                    g_out <= '0';
                    e_out <= '0';
                    l_out <= '1';
                end if;
    end comparator8;


    procedure register8(
        signal clk : in std_logic;
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
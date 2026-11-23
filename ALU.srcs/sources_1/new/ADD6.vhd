----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/28 11:16:49
-- Design Name: 
-- Module Name: ADD6 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic;
  CARRY_OUT: out std_logic;
  OVERFLOW: out std_logic
   );
end ADD6;

architecture Behavioral of ADD6 is
-- HALF ADDER
COMPONENT HA is
    Port ( 
        A: in std_logic;
        B: in std_logic;
        O: out std_logic; -- added value
        CO: out std_logic -- carry out
    );
end COMPONENT;
-- FULL ADDER
COMPONENT FA is
    Port ( 
        A: in std_logic;
        B: in std_logic;
        CI: in std_logic; -- carry in
        O: out std_logic; -- added value
        CO: out std_logic -- carry out
    );
end COMPONENT;

signal C0,C1,C2,C3,C4,C5: std_logic;
begin

HA0: HA PORT MAP(A=>A0, B=>B0, O=>RES0, CO=>C0);
FA0: FA PORT MAP(A=>C0, B=>A1, CI=>B1, O=>RES1, CO=>C1);
FA1: FA PORT MAP(A=>C1, B=>A2, CI=>B2, O=>RES2, CO=>C2);
FA2: FA PORT MAP(A=>C2, B=>A3, CI=>B3, O=>RES3, CO=>C3);
FA3: FA PORT MAP(A=>C3, B=>A4, CI=>B4, O=>RES4, CO=>C4);
FA4: FA PORT MAP(A=>C4, B=>A5, CI=>B5, O=>RES5, CO=>C5);

CARRY_OUT <= C5;
OVERFLOW <= C5;

end Behavioral;

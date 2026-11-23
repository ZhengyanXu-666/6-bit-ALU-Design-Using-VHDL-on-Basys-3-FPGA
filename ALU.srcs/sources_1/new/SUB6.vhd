----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/28 11:49:38
-- Design Name: 
-- Module Name: SUB6 - Behavioral
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

entity SUB6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic;
  CARRY_OUT: out std_logic
   );
end SUB6;

architecture Behavioral of SUB6 is
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

signal B_TMP0,B_TMP1,B_TMP2,B_TMP3,B_TMP4,B_TMP5: std_logic;
signal RES_TMP00,RES_TMP01,RES_TMP02,RES_TMP03,RES_TMP04,RES_TMP05: std_logic;
signal C00,C01,C02,C03,C04,C05,C06: std_logic;

begin
-- A-B = A + (!B + 1)
B_TMP0 <= NOT B0;
B_TMP1 <= NOT B1;
B_TMP2 <= NOT B2;
B_TMP3 <= NOT B3;
B_TMP4 <= NOT B4;
B_TMP5 <= NOT B5;
C00 <= '1';

FA0: FA PORT MAP(A=>A0, B=>B_TMP0, CI=>C00, O=>RES_TMP00, CO=>C01);
FA1: FA PORT MAP(A=>A1, B=>B_TMP1, CI=>C01, O=>RES_TMP01, CO=>C02);
FA2: FA PORT MAP(A=>A2, B=>B_TMP2, CI=>C02, O=>RES_TMP02, CO=>C03);
FA3: FA PORT MAP(A=>A3, B=>B_TMP3, CI=>C03, O=>RES_TMP03, CO=>C04);
FA4: FA PORT MAP(A=>A4, B=>B_TMP4, CI=>C04, O=>RES_TMP04, CO=>C05);
FA5: FA PORT MAP(A=>A5, B=>B_TMP5, CI=>C05, O=>RES_TMP05, CO=>C06);

CARRY_OUT <= NOT C06;
RES0 <= RES_TMP00;
RES1 <= RES_TMP01;
RES2 <= RES_TMP02;
RES3 <= RES_TMP03;
RES4 <= RES_TMP04;
RES5 <= RES_TMP05;

end Behavioral;

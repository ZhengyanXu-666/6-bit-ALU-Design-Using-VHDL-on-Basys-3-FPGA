----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/28 10:41:28
-- Design Name: 
-- Module Name: XOR6 - Behavioral
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

entity XOR6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic
   );
end XOR6;

architecture Behavioral of XOR6 is

begin
    RES5 <= A5 XOR B5;
    RES4 <= A4 XOR B4;
    RES3 <= A3 XOR B3;
    RES2 <= A2 XOR B2;
    RES1 <= A1 XOR B1;
    RES0 <= A0 XOR B0;

end Behavioral;

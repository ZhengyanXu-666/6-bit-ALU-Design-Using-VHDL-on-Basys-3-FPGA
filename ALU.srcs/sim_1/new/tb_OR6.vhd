----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/28 10:30:24
-- Design Name: 
-- Module Name: tb_OR6 - Behavioral
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

entity tb_OR6 is
--  Port ( );
end tb_OR6;

architecture Behavioral of tb_OR6 is

COMPONENT OR6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic
   );
END COMPONENT;

SIGNAL A : std_logic_vector(5 downto 0) := (others => '0');
SIGNAL B : std_logic_vector(5 downto 0) := (others => '0');
SIGNAL RES : std_logic_vector(5 downto 0);

begin

A <= "101010";
B <= "001010";


uut: OR6 PORT MAP (
  A5 => A(5),
  A4 => A(4),
  A3 => A(3),
  A2 => A(2),
  A1 => A(1),
  A0 => A(0),
  B5 => B(5),
  B4 => B(4),
  B3 => B(3),
  B2 => B(2),
  B1 => B(1),
  B0 => B(0),
  RES5 => RES(5),
  RES4 => RES(4),
  RES3 => RES(3),
  RES2 => RES(2),
  RES1 => RES(1),
  RES0 => RES(0)
   );

end Behavioral;

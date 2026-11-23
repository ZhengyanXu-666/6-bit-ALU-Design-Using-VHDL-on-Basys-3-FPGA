----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/28 14:17:48
-- Design Name: 
-- Module Name: tb_ALU - Behavioral
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

entity tb_ALU is
--  Port ( );
end tb_ALU;

architecture Behavioral of tb_ALU is

COMPONENT ALU is
  Port ( 
  
      ALUOP: in std_logic_vector(2 downto 0); -- use SW15-SW13
      A: in std_logic_vector(5 downto 0);     -- use SW12-SW7
      B: in std_logic_vector(5 downto 0);     -- use SW6-SW1
      
      RES: out std_logic_vector(5 downto 0);  -- use LED5-LED0
      ZERO: out std_logic;                    -- use LED6
      COUT: out std_logic;                    -- use LED7
      OFI: out std_logic                      -- use LED8
   );
end COMPONENT;

SIGNAL  ALUOP:  std_logic_vector(2 downto 0):= (others => '0'); 
SIGNAL  A:  std_logic_vector(5 downto 0):= (others => '0');     
SIGNAL  B:  std_logic_vector(5 downto 0):= (others => '0');    
      
SIGNAL  RES:  std_logic_vector(5 downto 0);  
SIGNAL  ZERO:  std_logic;                    
SIGNAL  COUT:  std_logic;                    
SIGNAL  OFI:  std_logic;                                        

begin

process
begin
    A <= "110101"; B <= "100101"; ALUOP <= "000"; wait for 20 ns;
    A <= "010101"; B <= "011111"; ALUOP <= "000"; wait for 20 ns;
    A <= "100001"; B <= "111110"; ALUOP <= "010"; wait for 20 ns;
    A <= "110101"; B <= "111110"; ALUOP <= "010"; wait for 20 ns;
    A <= "010010"; B <= "101000"; ALUOP <= "111"; wait for 20 ns;
    A <= "111111"; B <= "001100"; ALUOP <= "101"; wait for 20 ns;
    A <= "010010"; B <= "101000"; ALUOP <= "110"; wait for 20 ns;
    A <= "111111"; B <= "001100"; ALUOP <= "100"; wait for 20 ns;				 
	wait;					 
end process;

uut: ALU PORT MAP (
    ALUOP=>ALUOP,
    A=>A,
    B=>B,
      
    RES=>RES,
    ZERO=>ZERO,
    COUT=>COUT,
    OFI=>OFI
   );

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2025/02/28 13:42:35
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
  Port (
      ALUOP: in std_logic_vector(2 downto 0); -- use SW15-SW13
      A: in std_logic_vector(5 downto 0);     -- use SW12-SW7
      B: in std_logic_vector(5 downto 0);     -- use SW6-SW1
      
      RES: out std_logic_vector(5 downto 0);  -- use LED5-LED0   
      ZERO: out std_logic;                    -- use LED6        
      COUT: out std_logic;                    -- use LED7 
      OFI: out std_logic                      -- use LED8 
   );
end ALU;

architecture Behavioral of ALU is
--------------------------------------------------------------------------------
-- COMPONENTS
--------------------------------------------------------------------------------
COMPONENT ADD6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic;
  CARRY_OUT: out std_logic;
  OVERFLOW: out std_logic
   );
end COMPONENT;

COMPONENT AND6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic
   );
END COMPONENT;

COMPONENT OR6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic
   );
END COMPONENT;

COMPONENT XOR6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic
   );
END COMPONENT;

COMPONENT NOR6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic
   );
END COMPONENT;

COMPONENT SUB6 is
  Port (
  A5,A4,A3,A2,A1,A0: in std_logic;
  B5,B4,B3,B2,B1,B0: in std_logic;
  RES5,RES4,RES3,RES2,RES1,RES0: out std_logic;
  CARRY_OUT: out std_logic   
   );
end COMPONENT;
--------------------------------------------------------------------------------
-- SIGNALS
--------------------------------------------------------------------------------
SIGNAL RES_ADD, RES_SUB, RES_AND, RES_OR, RES_XOR, RES_NOR: std_logic_vector(5 downto 0);
SIGNAL CARRY_OUT_ADD, CARRY_OUT_SUB: std_logic;
SIGNAL OVERFLOW_ADD: std_logic;
--------------------------------------------------------------------------------
-- IMPLEMENTATION
--------------------------------------------------------------------------------
begin
-- Output Select
RES(0) <= (RES_ADD(0) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --ADDER 000
          (RES_SUB(0) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --SUB   010
		  (RES_AND(0) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --AND   100
		  (RES_OR(0)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or --OR    101
		  (RES_XOR(0) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --XOR   110
		  (RES_NOR(0) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or --NOR   111
		  ('0'        and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
          ;
		  
RES(1) <= (RES_ADD(1) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --ADDER 000
          (RES_SUB(1) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --SUB   010
		  (RES_AND(1) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --AND   100
		  (RES_OR(1)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or --OR    101
		  (RES_XOR(1) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --XOR   110
		  (RES_NOR(1) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or --NOR   111
		  ('0'        and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
          ;

RES(2) <= (RES_ADD(2) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --ADDER 000
          (RES_SUB(2) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --SUB   010
		  (RES_AND(2) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --AND   100
		  (RES_OR(2)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or --OR    101
		  (RES_XOR(2) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --XOR   110
		  (RES_NOR(2) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or --NOR   111
		  ('0'        and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
          ;

RES(3) <= (RES_ADD(3) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --ADDER 000
          (RES_SUB(3) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --SUB   010
		  (RES_AND(3) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --AND   100
		  (RES_OR(3)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or --OR    101
		  (RES_XOR(3) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --XOR   110
		  (RES_NOR(3) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or --NOR   111
		  ('0'        and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
          ;

RES(4) <= (RES_ADD(4) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --ADDER 000
          (RES_SUB(4) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --SUB   010
		  (RES_AND(4) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --AND   100
		  (RES_OR(4)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or --OR    101
		  (RES_XOR(4) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --XOR   110
		  (RES_NOR(4) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or --NOR   111
		  ('0'        and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
          ;

RES(5) <= (RES_ADD(5) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --ADDER 000
          (RES_SUB(5) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --SUB   010
		  (RES_AND(5) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or --AND   100
		  (RES_OR(5)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or --OR    101
		  (RES_XOR(5) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or --XOR   110
		  (RES_NOR(5) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or --NOR   111
		  ('0'        and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
          ;	

COUT <= (CARRY_OUT_ADD and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or
        (CARRY_OUT_SUB and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or
		('0'           and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or 
		('0'           and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or 
		('0'           and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or 
		('0'           and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or 
		('0'           and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
        ;
OFI <=  (OVERFLOW_ADD and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or
        ('0'          and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or 
		('0'          and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or 
		('0'          and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or 
		('0'          and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or 
		('0'          and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or 
		('0'          and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))
        ;
ZERO <= (NOT RES_ADD(5) and NOT RES_ADD(4) and NOT RES_ADD(3) and NOT RES_ADD(2) and NOT RES_ADD(1) and NOT RES_ADD(0) and NOT ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or
		(NOT RES_SUB(5) and NOT RES_SUB(4) and NOT RES_SUB(3) and NOT RES_SUB(2) and NOT RES_SUB(1) and NOT RES_SUB(0) and NOT ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or
        (NOT RES_AND(5) and NOT RES_AND(4) and NOT RES_AND(3) and NOT RES_AND(2) and NOT RES_AND(1) and NOT RES_AND(0) and     ALUOP(2) and NOT ALUOP(1) and NOT ALUOP(0)) or
        (NOT RES_OR(5)  and NOT RES_OR(4)  and NOT RES_OR(3)  and NOT RES_OR(2)  and NOT RES_OR(1)  and NOT RES_OR(0)  and     ALUOP(2) and NOT ALUOP(1) and     ALUOP(0)) or
        (NOT RES_XOR(5) and NOT RES_XOR(4) and NOT RES_XOR(3) and NOT RES_XOR(2) and NOT RES_XOR(1) and NOT RES_XOR(0) and     ALUOP(2) and     ALUOP(1) and NOT ALUOP(0)) or
        (NOT RES_NOR(5) and NOT RES_NOR(4) and NOT RES_NOR(3) and NOT RES_NOR(2) and NOT RES_NOR(1) and NOT RES_NOR(0) and     ALUOP(2) and     ALUOP(1) and     ALUOP(0)) or
        ('0'                                                                                                           and NOT ALUOP(2) and NOT ALUOP(1) and     ALUOP(0))  		
        ;

-- ADDER
ADD0: ADD6 PORT MAP (
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
  RES5 => RES_ADD(5),
  RES4 => RES_ADD(4),
  RES3 => RES_ADD(3),
  RES2 => RES_ADD(2),
  RES1 => RES_ADD(1),
  RES0 => RES_ADD(0),
  CARRY_OUT => CARRY_OUT_ADD,
  OVERFLOW => OVERFLOW_ADD
   );
   
-- SUB
SUB0: SUB6 PORT MAP (
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
  RES5 => RES_SUB(5),
  RES4 => RES_SUB(4),
  RES3 => RES_SUB(3),
  RES2 => RES_SUB(2),
  RES1 => RES_SUB(1),
  RES0 => RES_SUB(0),
  CARRY_OUT => CARRY_OUT_SUB
   ); 

-- AND
AND0: AND6 PORT MAP (
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
  RES5 => RES_AND(5),
  RES4 => RES_AND(4),
  RES3 => RES_AND(3),
  RES2 => RES_AND(2),
  RES1 => RES_AND(1),
  RES0 => RES_AND(0)
   );

-- OR
OR0: OR6 PORT MAP (
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
  RES5 => RES_OR(5),
  RES4 => RES_OR(4),
  RES3 => RES_OR(3),
  RES2 => RES_OR(2),
  RES1 => RES_OR(1),
  RES0 => RES_OR(0)
   );

-- XOR
XOR0: XOR6 PORT MAP (
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
  RES5 => RES_XOR(5),
  RES4 => RES_XOR(4),
  RES3 => RES_XOR(3),
  RES2 => RES_XOR(2),
  RES1 => RES_XOR(1),
  RES0 => RES_XOR(0)
   ); 

-- NOR
NOR0: NOR6 PORT MAP (
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
  RES5 => RES_NOR(5),
  RES4 => RES_NOR(4),
  RES3 => RES_NOR(3),
  RES2 => RES_NOR(2),
  RES1 => RES_NOR(1),
  RES0 => RES_NOR(0)
   );   

end Behavioral;

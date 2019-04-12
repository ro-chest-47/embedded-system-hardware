----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:40:29 04/10/2019 
-- Design Name: 
-- Module Name:    BCD_2digit_sub_adder_7_to_4 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_2digit_sub_adder_7_to_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           reverse : in  STD_LOGIC;
           cdown : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           opt : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (3 downto 0));
end BCD_2digit_sub_adder_7_to_4;

architecture Behavioral of BCD_2digit_sub_adder_7_to_4 is



begin


end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:15:33 04/10/2019 
-- Design Name: 
-- Module Name:    BCD_2digit_adder - Behavioral 
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

entity BCD_2digit_adder is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC);
end BCD_2digit_adder;

architecture Behavioral of BCD_2digit_adder is
component BCD_adder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           cin : in  STD_LOGIC);
end component;

signal tcout : std_logic;

begin


U1 : BCD_adder port map(A(7 downto 4), B(7 downto 4), S(7 downto 4), Cout, tcout);
U2 : BCD_adder port map(A(3 downto 0), B(3 downto 0), S(3 downto 0), tcout, Cin);

end Behavioral;


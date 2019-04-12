----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:53:33 04/10/2019 
-- Design Name: 
-- Module Name:    Full_adder_4bits - Behavioral 
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

entity Full_adder_4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end Full_adder_4bits;

architecture Behavioral of Full_adder_4bits is

component Full_adder is
    Port ( a, b, cin : in  STD_LOGIC;
           s, cout : out  STD_LOGIC);
end component;

signal tcout1, tcout2, tcout3 : std_logic;

begin

U1 : Full_adder port map( a(0), b(0), cin, sum(0), tcout1);
U2 : Full_adder port map( a(1), b(1), tcout1, sum(1), tcout2);
U3 : Full_adder port map( a(2), b(2), tcout2, sum(2), tcout3);
U4 : Full_adder port map( a(3), b(3), tcout3, sum(3), cout);

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:02:48 04/10/2019 
-- Design Name: 
-- Module Name:    BCD_adder - Behavioral 
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

entity BCD_adder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC;
           cin : in  STD_LOGIC);
end BCD_adder;

architecture Behavioral of BCD_adder is

component Full_adder_4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;

signal tcout, con1, con2, output, no : std_logic;
signal tsum, tinput : std_logic_vector (3 downto 0);

begin

con1 <= tsum(3) and tsum(2);
con2 <= tsum(3) and tsum(1);
output <= con1 or con2 or tcout or (no and '0');
tinput <= '0' & output & output & '0';
cout <= output;


U1: Full_adder_4bits port map(a, b, cin, tsum, tcout);
U2: Full_adder_4bits port map(tinput, tsum, '0', s, no);

end Behavioral;


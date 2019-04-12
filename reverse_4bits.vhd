----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:00:28 04/10/2019 
-- Design Name: 
-- Module Name:    reverse_4bits - Behavioral 
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

entity reverse_4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sub : in  STD_LOGIC;
           re : out  STD_LOGIC;
           same : out  STD_LOGIC);
end reverse_4bits;

architecture Behavioral of reverse_4bits is

component reverse is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           same : out  STD_LOGIC;
           re : out  STD_LOGIC;
           ena : in  STD_LOGIC);
end component;

signal tsame1, tsame2, tsame3, f_re, f_same : std_logic;
signal t_re : std_logic_vector (3 downto 0);

begin

U1 : reverse port map (a(3), b(3), tsame1, t_re(3), sub);
U2 : reverse port map (a(2), b(2), tsame2, t_re(2), tsame1);
U3 : reverse port map (a(1), b(1), tsame3, t_re(1), tsame2);
U4 : reverse port map (a(0), b(0), f_same, t_re(0), tsame3);

f_re <= t_re(3) or t_re(2) or t_re(1) or t_re(0);

re <= sub and f_re;
same <= sub and f_same;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:04:45 04/11/2019 
-- Design Name: 
-- Module Name:    homwork_display - Behavioral 
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

entity homwork_display is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           sub : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC;
           sign : out  STD_LOGIC);
end homwork_display;

architecture Behavioral of homwork_display is

component homework is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           sub : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           sign : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

component display is
    Port ( S_3 : in  STD_LOGIC_VECTOR (7 downto 0);
           S_D : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal temp_s : STD_LOGIC_VECTOR (7 downto 0);

begin

U1: homework port map (A, B, Cin, sub, temp_s, sign, Cout);
U2: display port map (temp_s, S);

end Behavioral;


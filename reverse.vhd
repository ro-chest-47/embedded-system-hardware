----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:41:11 04/10/2019 
-- Design Name: 
-- Module Name:    reverse - Behavioral 
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

entity reverse is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           same : out  STD_LOGIC;
           re : out  STD_LOGIC;
           ena : in  STD_LOGIC);
end reverse;

architecture Behavioral of reverse is

begin

--re <= (not a) and b;
--same <= not (a xor b);

process (ena, a, b)
begin
	if(ena = '0') then
		re <= '0';
		same <= '0';
	elsif (ena = '1') then
		re <= (not a) and b;
		same <= not (a xor b);
	end if;
end process;


end Behavioral;


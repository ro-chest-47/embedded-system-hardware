----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:04 04/10/2019 
-- Design Name: 
-- Module Name:    convertor - Behavioral 
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

entity convertor is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           reverse : in  STD_LOGIC;
           A_con : out  STD_LOGIC_VECTOR (3 downto 0);
           B_con : out  STD_LOGIC_VECTOR (3 downto 0));
end convertor;

architecture Behavioral of convertor is

begin

	process (reverse, A, B)
	begin
	
		if (reverse = '1') then 
			A_con <= B;
			B_con <= A;
		elsif (reverse = '0') then
			A_con <= A;
			B_con <= B;
		end if;
		
	end process;


end Behavioral;


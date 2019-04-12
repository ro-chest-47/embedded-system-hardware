----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:43:12 04/10/2019 
-- Design Name: 
-- Module Name:    BDC_sub_adder_7_to_4 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_sub_adder_7_to_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           sub : in  STD_LOGIC;
			  reverse : in STD_LOGIC;
           Cdown : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end BCD_sub_adder_7_to_4;

architecture Behavioral of BCD_sub_adder_7_to_4 is

component Full_adder_4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component;

component convertor is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           reverse : in  STD_LOGIC;
           A_con : out  STD_LOGIC_VECTOR (3 downto 0);
           B_con : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal tcout, ttcout : STD_LOGIC;
signal tempa, tempb, ttempb, ttempa, tsum : STD_LOGIC_VECTOR (3 downto 0);

begin

U1 : convertor port map (A, B, reverse, tempa, tempb);
U2 : Full_adder_4bits port map (ttempa, ttempb, Cin, tsum, tcout);

	process (sub, tempb) 
	begin
		if(sub = '1') then --subtraction
			ttempb <= (not(tempb) + "0001");
		elsif(sub = '0') then -- addition
			ttempb <= tempb;
		end if;
	end process;

	process (Cdown, tempa) 
	begin
		if(Cdown = '1') then
			ttempa <= (tempa + "1111");
		elsif (Cdown = '0') then
			ttempa <= tempa;
		end if;
	end process;
	
	ttcout <= (not sub) and tcout;
	Cout <= ttcout;
	
	process (ttcout, tsum, sub)
	begin
		if(ttcout = '1') then
			sum <= tsum + "0011";
		elsif (ttcout = '0') then
			if(sub = '1') then
				sum <= tsum + "0011";
			elsif (sub = '0') then
				sum <= tsum + "1101";
			end if;
		end if;
	end process;


end Behavioral;


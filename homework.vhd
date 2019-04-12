----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:38 04/11/2019 
-- Design Name: 
-- Module Name:    homework - Behavioral 
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

entity homework is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           sub : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           sign : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end homework;

architecture Behavioral of homework is

component reverse_4bits is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           sub : in  STD_LOGIC;
           re : out  STD_LOGIC;
           same : out  STD_LOGIC);
end component;

component BCD_sub_adder_7_to_4 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           sub : in  STD_LOGIC;
			  reverse : in STD_LOGIC;
           Cdown : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component BCD_sub_adder_3_to_0 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           sub : in  STD_LOGIC;
           reverse : in  STD_LOGIC;
           Cdown : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

signal temp_reverse_front, temp_reverse_back, temp_same_front, temp_same_back : STD_LOGIC;
signal temp_Cdown, input_reverse_front, input_reverse_back, temp_Cout : STD_LOGIC;

begin

U1: reverse_4bits port map (A(7 downto 4), B(7 downto 4), sub, temp_reverse_front, temp_same_front);
U2: reverse_4bits port map (A(3 downto 0), B(3 downto 0), sub, temp_reverse_back, temp_same_back);

input_reverse_front <= temp_reverse_front;
input_reverse_back <= (temp_reverse_back and (temp_same_front or temp_reverse_front)) or 
									(temp_reverse_front and not(temp_same_back or temp_reverse_back));

sign <= temp_reverse_front or (temp_reverse_back and temp_same_front);
temp_Cdown <= (not (temp_same_front or temp_same_back)) and (temp_reverse_front xor temp_reverse_back);

U3: BCD_sub_adder_3_to_0 port map (A(3 downto 0), B(3 downto 0), Cin, sub, input_reverse_back, temp_Cdown, S(3 downto 0), temp_Cout);
U4: BCD_sub_adder_7_to_4 port map (A(7 downto 4), B(7 downto 4), sub, input_reverse_front, temp_Cdown, temp_Cout, Cout, S(7 downto 4));


end Behavioral;


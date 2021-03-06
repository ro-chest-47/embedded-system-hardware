--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:47:17 04/11/2019
-- Design Name:   
-- Module Name:   D:/xilinx_project/embedded/homework_TB.vhd
-- Project Name:  embedded
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: homework
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY homework_TB IS
END homework_TB;
 
ARCHITECTURE behavior OF homework_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT homework
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         sub : IN  std_logic;
         S : OUT  std_logic_vector(7 downto 0);
         sign : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal sub : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal sign : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: homework PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          sub => sub,
          S => S,
          sign => sign,
          Cout => Cout
        );

   -- Clock process definitions
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		A<="01000111";
		B<="01101011";
		
		wait for 100 ns;
		
		sub<='1';
		
		wait for 100 ns;
		
		A<="01101000";
		B<="01111010";
		sub<='0';
		
		wait for 100 ns;
		
		sub<='1';
		
		wait for 100 ns;
		
		A<="10010111";
		B<="10110101";
		sub<='0';
		
		wait for 100 ns;
		
		sub<='1';
		
		wait for 100 ns;
		
		A<="10101011";
		B<="10001100";
		sub<='0';
		
		wait for 100 ns;
		
		sub<='1';
      -- insert stimulus here 

      wait;
   end process;

END;

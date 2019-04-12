--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:42:58 04/11/2019
-- Design Name:   
-- Module Name:   D:/xilinx_project/embedded/BCD_sub_adder_3_to_0_TB.vhd
-- Project Name:  embedded
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BCD_sub_adder_3_to_0
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
 
ENTITY BCD_sub_adder_3_to_0_TB IS
END BCD_sub_adder_3_to_0_TB;
 
ARCHITECTURE behavior OF BCD_sub_adder_3_to_0_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BCD_sub_adder_3_to_0
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         sub : IN  std_logic;
         reverse : IN  std_logic;
         Cdown : IN  std_logic;
         sum : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal sub : std_logic := '0';
   signal reverse : std_logic := '0';
   signal Cdown : std_logic := '0';

 	--Outputs
   signal sum : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BCD_sub_adder_3_to_0 PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          sub => sub,
          reverse => reverse,
          Cdown => Cdown,
          sum => sum,
          Cout => Cout
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		A<="0110";
		B<="1010";
		
		
		
		wait for 100 ns;
		
		reverse <= '1';
		sub <= '1';
		
		wait for 100 ns;
		
		reverse <= '0';
		Cdown <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:36:07 04/10/2019
-- Design Name:   
-- Module Name:   D:/xilinx_project/embedded/BCD_sub_adder_7_to_4_TB.vhd
-- Project Name:  embedded
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BDC_sub_adder_7_to_4
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
 
ENTITY BCD_sub_adder_7_to_4_TB IS
END BCD_sub_adder_7_to_4_TB;
 
ARCHITECTURE behavior OF BCD_sub_adder_7_to_4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BDC_sub_adder_7_to_4
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         opt : IN  std_logic;
         reverse : IN  std_logic;
         Cdown : IN  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         result : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal opt : std_logic := '0';
   signal reverse : std_logic := '0';
   signal Cdown : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal result : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BDC_sub_adder_7_to_4 PORT MAP (
          A => A,
          B => B,
          opt => opt,
          reverse => reverse,
          Cdown => Cdown,
          Cin => Cin,
          Cout => Cout,
          result => result
        );

   -- Clock process definitions
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		A <= "0110";
		B <= "1010";
		
		opt <= '0';
		reverse <= '0';
		Cdown <= '0';
		Cin <= '0';
		
		wait for 100 ns;
		
		opt <= '1';
		reverse <= '1';
		
		wait for 100 ns;
		
		Cdown <= '1';
		
		
      -- insert stimulus here 

      wait;
   end process;

END;

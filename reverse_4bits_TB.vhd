--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:15:55 04/10/2019
-- Design Name:   
-- Module Name:   D:/xilinx_project/embedded/reverse_4bits_TB.vhd
-- Project Name:  embedded
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reverse_4bits
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
 
ENTITY reverse_4bits_TB IS
END reverse_4bits_TB;
 
ARCHITECTURE behavior OF reverse_4bits_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reverse_4bits
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         sub : IN  std_logic;
         re : OUT  std_logic;
         same : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal sub : std_logic := '0';

 	--Outputs
   signal re : std_logic;
   signal same : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reverse_4bits PORT MAP (
          a => a,
          b => b,
          sub => sub,
          re => re,
          same => same
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
		sub <= '0';
		a <= "1010";
		b <= "1100";
		
		wait for 30 ns;
		
		sub <= '1';
		
		wait for 30 ns;
		
		a <= "1100";
		
		wait for 30 ns;
		
		b <= "0110";
      -- hold reset state for 100 ns.

      -- insert stimulus here 

      wait;
   end process;

END;

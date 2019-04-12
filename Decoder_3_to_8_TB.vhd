--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:43:56 04/10/2019
-- Design Name:   
-- Module Name:   D:/xilinx_project/embedded/Decoder_3_to_8_TB.vhd
-- Project Name:  embedded
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder_3_to_8
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
 
ENTITY Decoder_3_to_8_TB IS
END Decoder_3_to_8_TB;
 
ARCHITECTURE behavior OF Decoder_3_to_8_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder_3_to_8
    PORT(
         D : IN  std_logic_vector(2 downto 0);
         Y : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_3_to_8 PORT MAP (
          D => D,
          Y => Y
        );

   -- Clock process definitions
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		
		D <= "001" after 30 ns,
		     "010" after 60 ns,
			  "011" after 90 ns,
			  "100" after 120 ns,
			  "101" after 150 ns,
			  "110" after 180 ns,
			  "111" after 210 ns;
			  
		wait;

   end process;

END;

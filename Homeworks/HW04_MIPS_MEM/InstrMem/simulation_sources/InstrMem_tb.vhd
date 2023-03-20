LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_package.ALL;
 
ENTITY InstrMem_tb IS
END InstrMem_tb;
 
ARCHITECTURE behavior OF InstrMem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT InstrMem
       PORT( 
          A     : IN  std_logic_vector (n_bits_address - 1 DOWNTO 0);
          rst   : IN  std_logic;
          Instr : OUT std_logic_vector (instr_mem_width - 1 DOWNTO 0)
       );
    END COMPONENT;

   --Inputs
   signal A 	: std_logic_vector (n_bits_address - 1 DOWNTO 0) := (others => '0');
   signal rst   : std_logic := '0';

   --Outputs
   signal Instr : std_logic_vector (instr_mem_width - 1 DOWNTO 0);

   -- Clock period definitions
   constant delay_period : time := 10 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: InstrMem
        PORT MAP (A => A,
                  rst => rst,
                  Instr => Instr
                 );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	  rst <= '1';
      wait for delay_period*8;

      -- insert stimulus here 
	  rst <= '0';
	  A <= "00000000000000000000000000000000";
      wait for delay_period*3;	

	  A <= "00000000000000000000000000000001";
      wait for delay_period*3;		

	  A <= "00000000000000000000000000000010";
      wait for delay_period*3;	

	  A <= "00000000000000100000000000000100";
      wait for delay_period*3;

	  A <= "00000000000000000000000000000011";
      wait for delay_period*3;	

	  A <= "00000000000000000000000000000100";
      wait for delay_period*3;

	  rst <= '1';
      wait for delay_period*8;	

      wait;
   end process;

END;

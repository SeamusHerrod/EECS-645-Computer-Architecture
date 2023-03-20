LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_package.ALL;
 
ENTITY DataMem_tb IS
END DataMem_tb;
 
ARCHITECTURE behavior OF DataMem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DataMem
	   PORT( 
	      A        : IN  std_logic_vector (n_bits_address - 1 DOWNTO 0);
	      MemWrite : IN  std_logic;
	      WD       : IN  std_logic_vector (data_mem_width - 1 DOWNTO 0);
	      clk      : IN  std_logic;
	      rst      : IN  std_logic;
	      RD       : OUT std_logic_vector (data_mem_width - 1 DOWNTO 0)
	   );
	END COMPONENT;
   
   --Inputs
   signal A 	   : std_logic_vector (n_bits_address - 1 DOWNTO 0) := (others => '0');
   signal MemWrite : std_logic := '0';
   signal WD  	   : std_logic_vector (data_mem_width - 1 DOWNTO 0) := (others => '0');
   signal clk      : std_logic := '0';
   signal rst      : std_logic := '0';

   --Outputs
   signal RD 	: std_logic_vector (data_mem_width - 1 DOWNTO 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: DataMem
        PORT MAP (A => A,
                  MemWrite => MemWrite,
                  WD => WD,
                  clk => clk,
                  rst => rst,
                  RD => RD
                 );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 20 ns.
	  rst <= '1';
	  MemWrite <= '0';
	  A <= (others => '0');
	  WD <= (others => '0');		
      wait for clk_period*2;	
      
	  -- insert stimulus here 
	  rst <= '0';
	  MemWrite <= '1';

	  A   <= "00000000000000000000000000000000";
	  WD <= "00000000000000000000000000000111";		
      wait for clk_period*3;

	  A   <= "00000000000000000000000000000101";
	  WD <= "00000000000000000000000000001111";		
      wait for clk_period*3;

	  A   <= "00000000000000000000000000001100";
	  WD <= "00000000000000000000000000011111";			
      wait for clk_period*3;		

	  MemWrite <= '0';
	  WD <= (others => '1');	

	  A   <= "00000000000000000000000000000101";
      wait for clk_period*3;
		
	  A   <= "00000000000000000000000000001100";
      wait for clk_period*3;	

	  MemWrite <= '1';
	  A   <= "00000000000000000000000001110100";
	  WD <= "00000000000000000000000000111111";		
      wait for clk_period*3;

	  A   <= "00000000000000000000000001110101";
	  WD <= "00000000000000000000000001111111";			
      wait for clk_period*3;		

	  MemWrite <= '0';
	  WD <= (others => '1');	

	  A   <= "00000000000000000000000001110100";
      wait for clk_period*3;
		
	  A   <= "00000000000000000000000001110101";
      wait for clk_period*3;
		
	  rst <= '1';
      wait for clk_period*3;			
		
      wait;
   end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_package.ALL;
USE work.math_real.ALL;
 
ENTITY regfile_tb IS
END regfile_tb;
 
ARCHITECTURE behavior OF regfile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RegFile
       PORT( 
          RA1      : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
          RA2      : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
          RegWrite : IN  std_logic;
          WA       : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
          WD       : IN  std_logic_vector (reg_file_width - 1 DOWNTO 0);
          clk      : IN  std_logic;
          rst      : IN  std_logic;
          RD1      : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0);
          RD2      : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0)
       );
    END COMPONENT;	    
   
   --Inputs
   signal RA1 	   : std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0) := (others => '0');
   signal RA2 	   : std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0) := (others => '0');
   signal RegWrite : std_logic := '0';
   signal WA  	   : std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0) := (others => '0');
   signal WD  	   : std_logic_vector (reg_file_width - 1 DOWNTO 0) := (others => '0');
   signal clk      : std_logic := '0';
   signal rst      : std_logic := '0';

   --Outputs
   signal RD1 : std_logic_vector (reg_file_width - 1 DOWNTO 0);
   signal RD2 : std_logic_vector (reg_file_width - 1 DOWNTO 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegFile
        PORT MAP (RA1 => RA1,
                  RA2 => RA2,
                  RegWrite => RegWrite,
                  WA => WA,
                  WD => WD,
                  clk => clk,
                  rst => rst,
                  RD1 => RD1,
                  RD2 => RD2
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
        RegWrite <= '0';
        
        RA1 <= "00000";
        RA2 <= "00000";
        WA <= "00000";
        WD <= "00000000000000000000000000000000";		
        wait for clk_period*2;	
      
        -- insert stimulus here 
        rst <= '0';
        RegWrite <= '1';
        
        WA <= "00000";
        WD <= "00000000000000000000000000000111";		
        wait for clk_period*3;

        WA <= "00101";
        WD <= "00000000000000000000000000001111";		
        wait for clk_period*3;

        WA <= "01100";
        WD <= "00000000000000000000000000011111";		
        wait for clk_period*3;		

        WA <= "10110";
        WD <= "00000000000000000000000000111111";		
        wait for clk_period*3;	

        WA <= "11100";
        WD <= "00000000000000000000000001111111";		
        wait for clk_period*3;
       
        RegWrite <= '0';
        
        RA1 <= "00101";
        RA2 <= "01100";
        wait for clk_period*3;

        RA1 <= "01100";
        RA2 <= "00101";
        wait for clk_period*3;

        RA1 <= "10110";
        RA2 <= "11100";
        wait for clk_period*3;

        RA1 <= "11100";
        RA2 <= "10110";
        wait for clk_period*3;
        
        rst <= '1';
        wait for clk_period*3;			
        
        wait;
    end process;

END;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_package.ALL;
USE work.math_real.ALL;
 
ENTITY cu_tb IS
END cu_tb;
 
ARCHITECTURE behavior OF cu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

	COMPONENT CU
	   PORT( 
	      Instr      : IN     std_logic_vector (n_bits_instr - 1 DOWNTO 0);
	      ALUControl : OUT    std_logic_vector (n_bits_of(n_functions_alu) - 1 DOWNTO 0);
	      ALUSrc     : OUT    std_logic;
	      BEQ        : OUT    std_logic;
	      J          : OUT    std_logic;
	      MemToReg   : OUT    std_logic;
	      MemWrite   : OUT    std_logic;
	      RegDst     : OUT    std_logic;
	      RegWrite   : OUT    std_logic
	   );
	END COMPONENT;

   --Inputs
   signal Instr : std_logic_vector(n_bits_instr - 1 downto 0) := (others => '0');

 	--Outputs
   signal ALUControl : std_logic_vector (n_bits_of(n_functions_alu) - 1 DOWNTO 0);
   signal ALUSrc : std_logic;
   signal BEQ : std_logic;
   signal J : std_logic;
   signal MemToReg : std_logic;
   signal MemWrite : std_logic;
   signal RegDst : std_logic;
   signal RegWrite : std_logic;
 
   constant delay_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          Instr => Instr,
          ALUControl => ALUControl,
          ALUSrc => ALUSrc,
          BEQ => BEQ,
          J => J,
          MemToReg => MemToReg,
          MemWrite => MemWrite,
          RegDst => RegDst,
          RegWrite => RegWrite
        );

   -- Stimulus process
   stim_proc: process
   begin		
       
        -- insert stimulus here
      	Instr <= (others => '0');
      		
		Instr(opcode_end DOWNTO opcode_start) <= "000000"; -- R-Type
		wait for delay_period*3;
		
		Instr(funct_end DOWNTO funct_start)   <= "100100"; -- R-Type, AND
		wait for delay_period*3;
		
		Instr(funct_end DOWNTO funct_start)   <= "100101"; -- R-Type, OR
		wait for delay_period*3;

		Instr(funct_end DOWNTO funct_start)   <= "100000"; -- R-Type, add
		wait for delay_period*3;
		
		Instr(funct_end DOWNTO funct_start)   <= "100010"; -- R-Type, sub
		wait for delay_period*3;

		Instr(funct_end DOWNTO funct_start)   <= "101010"; -- R-Type, slt
		wait for delay_period*3;
		
		Instr(funct_end DOWNTO funct_start)   <= "100111"; -- R-Type, NOR
		wait for delay_period*3;
		
		Instr(opcode_end DOWNTO opcode_start) <= "100011"; -- I-Type, lw
		wait for delay_period*3;
		
		Instr(opcode_end DOWNTO opcode_start) <= "101011"; -- I-Type, sw
		wait for delay_period*3;
		
		Instr(opcode_end DOWNTO opcode_start) <= "000100"; -- I-Type, beq
		wait for delay_period*3;
		
		Instr(opcode_end DOWNTO opcode_start) <= "000010"; -- J-Type, j
		wait for delay_period*3;

		Instr(opcode_end DOWNTO opcode_start) <= "001000"; -- I-Type, addi
		wait for delay_period*3;
		
		Instr(opcode_end DOWNTO opcode_start) <= "111111"; -- undefined
		wait for delay_period*3;
				
      wait;
   end process;

END;

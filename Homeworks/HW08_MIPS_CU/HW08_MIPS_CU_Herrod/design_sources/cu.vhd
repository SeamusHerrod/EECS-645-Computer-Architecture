LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY CU IS
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
END CU;

ARCHITECTURE behav OF CU IS

	SIGNAL opcode : NATURAL RANGE 0 TO (2**(opcode_end - opcode_start + 1) - 1);
	SIGNAL funct  : NATURAL RANGE 0 TO (2**(funct_end - funct_start + 1) - 1);
	SIGNAL ALUControl_int : NATURAL RANGE 0 TO (n_functions_alu - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
   ControlUnit: PROCESS ( Instr, opcode, funct )
   BEGIN
    opcode <= TO_INTEGER( UNSIGNED( Instr( opcode_end downto opcode_start ) ) );
    
    -- initialization 
    ALUControl <= "0000";
    ALUControl_int <= 0;
    ALUSrc <= '0';
    BEQ <= '0';
    J <= '0';
    MemToReg <= '0';
    MemWrite <= '0';
    RegDst <= '0';
    RegWrite <= '0';
   
    
    IF ( opcode = 0 ) THEN 
        funct <= TO_INTEGER( UNSIGNED ( Instr( funct_end downto funct_start ) ) );
        
        IF ( funct = 36 ) THEN
            RegDst <= '1';
            RegWrite <= '1';
            ALUControl <= "0000"; 
            ALUControl_int <=  0;
            
            
         ELSIF ( funct = 37 ) THEN 
            ALUControl <= "0001";
            ALUControl_int <= 1;
            RegDst <= '1';
            RegWrite <= '1';
            
         ELSIF ( funct = 32 ) THEN 
            ALUControl <= "0010";
            ALUControl_int <= 2;
            RegDst <= '1';
            RegWrite <= '1';
            
         ELSIF ( funct = 34 ) THEN
            ALUControl <= "0110";
            ALUControl_int <= 6;
            RegDst <= '1';
            RegWrite <= '1';
            
         ELSIF ( funct = 42 ) THEN
            ALUControl <= "0111";
            ALUControl_int <= 7;
            RegDst <= '1';
            RegWrite <= '1';
            
         ELSIF ( funct = 39 ) THEN
            ALUControl <= "1100";
            ALUControl_int <= 12;
            RegDst <= '1';
            RegWrite <= '1';
            
        END IF;
        
        
    ELSIF ( opcode = 35 ) THEN 
        ALUControl <= "0010";
        ALUControl_int <= 2;
        ALUSrc <= '1';
        MemToReg <= '1';
        RegWrite <= '1';
    ELSIF ( opcode = 43 ) THEN 
        ALUControl <= "0010";
        ALUControl_int <= 2;
        ALUSrc <= '1';
        MemWrite <= '1';

    ELSIF ( opcode = 4 ) THEN 
        ALUControl <= "0110";
        ALUControl_int <= 6;
        BEQ <= '1';

    ELSIF ( opcode = 2 ) THEN 
        ALUControl <= "0000";
        ALUControl_int <= 0;
        J <= '1';

    ELSIF ( opcode = 8 ) THEN 
        ALUControl <= "0010";
        ALUControl_int <= 2;
        ALUSrc <= '1';
        RegWrite <= '1';
    END IF;
   END PROCESS; 
   ----------------------------------  

END behav;

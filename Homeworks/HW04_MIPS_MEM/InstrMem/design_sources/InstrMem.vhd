LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY InstrMem IS
   PORT( 
      A     : IN  std_logic_vector (n_bits_address - 1 DOWNTO 0);
      rst   : IN  std_logic;
      Instr : OUT std_logic_vector (instr_mem_width - 1 DOWNTO 0)
   );
END InstrMem;

ARCHITECTURE behav OF InstrMem IS

   -- Internal signal declarations
   SIGNAL instr_mem  : mem_type(0 to instr_mem_depth - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------

Process1: PROCESS ( A, rst, instr_mem )
BEGIN 
    
    IF ( rst = '1' ) THEN
        Instr <= zeros;
        instr_mem <= my_program;
    ELSIF ( TO_INTEGER( UNSIGNED ( A ) ) < instr_mem_depth ) THEN
        Instr <= instr_mem( TO_INTEGER( UNSIGNED( A ) ) );    
    END IF;
END PROCESS;


   ----------------------------------    

END behav;

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
read_port : PROCESS (A, rst)
BEGIN
    Instr <= (OTHERS => '0'); -- Default instruction is NOP (No OPeration)
    IF (rst = '1') THEN
        instr_mem <= my_program; -- Asynchronous reset mimicking program load
        Instr <= ( others => '0' );
    ELSE
        IF (( to_integer( unsigned( A ) ) - to_integer( unsigned( text_segment_start)) )/4 > 0 AND ( to_integer( unsigned( A ) ) - to_integer( unsigned( text_segment_start)) )/4 < instr_mem_depth) THEN -- Address guard for read port
            Instr <= instr_mem(( to_integer( unsigned( A ) ) - to_integer( unsigned( text_segment_start)) )/4); -- Read operation
        END IF;
    END IF;

END PROCESS;
   ----------------------------------    

END behav;

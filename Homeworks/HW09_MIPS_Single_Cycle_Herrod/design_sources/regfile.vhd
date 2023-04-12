LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY RegFile IS
   PORT( 
      RA1      : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      RA2 	   : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      RegWrite : IN  std_logic;
      WA  	   : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      WD  	   : IN  std_logic_vector (reg_file_width - 1 DOWNTO 0);
      clk      : IN  std_logic;
      rst      : IN  std_logic;
      RD1 	   : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0);
      RD2 	   : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0)
   );
END RegFile;

ARCHITECTURE behav OF RegFile IS

   -- Internal signal declarations
   SIGNAL reg_file  : mem_type(0 to reg_file_depth - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------



   ---------------------------------- 

END behav;

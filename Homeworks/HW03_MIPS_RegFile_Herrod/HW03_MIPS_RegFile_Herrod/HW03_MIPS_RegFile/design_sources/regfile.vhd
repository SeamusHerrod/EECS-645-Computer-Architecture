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


    Process1 : PROCESS( RA1, reg_file )
    BEGIN
    

        IF ( TO_INTEGER( UNSIGNED ( RA1 ) ) <= reg_file_depth ) THEN
            RD1 <= reg_file ( TO_INTEGER( UNSIGNED( RA1 ) ) );
        ELSIF ( TO_INTEGER( UNSIGNED ( RA1 ) ) > reg_file_depth ) THEN
            RD1 <= reg_file( 0 );
        END IF;
  
    END PROCESS;


    Process2 : PROCESS( RA2, reg_file )
    BEGIN
    
    IF ( TO_INTEGER( UNSIGNED ( RA2 ) ) < reg_file_depth ) THEN
        RD2 <= reg_file ( TO_INTEGER( UNSIGNED( RA2 ) ) );
    ElSIF ( TO_INTEGER( UNSIGNED ( RA2 ) ) >= reg_file_depth ) THEN
        RD2 <= reg_file ( 0 );
    END IF;
    
    END PROCESS;



    Process3 : PROCESS(RegWrite, WD, WA, clk, rst)
    BEGIN     
        IF ( rst = '1' ) THEN
            reg_file <= initial_reg_file;

        ELSIF (clk'EVENT AND clk = '1') THEN
                IF ( RegWrite = '1' ) THEN
           
                    IF ( UNSIGNED( WA ) > 0 AND UNSIGNED ( WA ) < reg_file_depth ) THEN
                        reg_file( TO_INTEGER( UNSIGNED( WA ) ) ) <=  WD;
                    END IF;
                END IF;
        END IF; 

    END PROCESS;

   ---------------------------------- 

END behav;

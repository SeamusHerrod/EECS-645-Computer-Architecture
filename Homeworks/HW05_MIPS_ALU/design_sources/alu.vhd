LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY ALU IS
   PORT( 
      A           : IN     std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      ALUControl  : IN     std_logic_vector (n_bits_of(n_functions_alu) - 1 DOWNTO 0);
      B           : IN     std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      C           : OUT    std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      zero        : OUT    std_logic;
      overflow    : OUT    std_logic
   );
END ALU;

ARCHITECTURE behav OF ALU IS

   -- Internal signal declarations
   SIGNAL ALUControl_int : natural RANGE 0 TO (n_functions_alu - 1);
   SIGNAL C_internal : std_logic_vector(n_bits_alu  - 1 DOWNTO 0);
   SIGNAL s_A, s_B, s_C : std_logic; -- Sign bits of A, B, C

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
   process1: PROCESS ( ALUControl, C_internal, A, B ) 
   BEGIN
   ALUControl_int <= TO_INTEGER( UNSIGNED( ALUControl ) );
   CASE ALUControl is 
   when "0000" =>
    C_internal <= A AND B;
   when "0001" =>
    C_internal <= A OR B;
   when "0010" =>
    C_internal <= STD_LOGIC_VECTOR( ( SIGNED( A ) + SIGNED( B ) ) );
   when "0110" =>
    C_internal <= STD_LOGIC_VECTOR( SIGNED( A ) - SIGNED( B ) );
   when "0111" =>
    IF ( SIGNED( A ) < SIGNED( B ) ) THEN 
        C_internal <= ones;
    ELSE
        C_internal <= zeros;
    END IF;
   when "1100" => 
    C_internal <= A NOR B;
   when others => null;
   C_internal <= zeros;
   END CASE; 
   
    C <= C_internal;
    s_A <= A(n_bits_alu - 1);
    s_B <= B(n_bits_alu - 1);
    s_C <= C_internal(n_bits_alu - 1);
   END PROCESS;

   process2: PROCESS (s_A, s_B, s_C, C_internal, ALUControl )
    BEGIN

    IF ( C_internal = zeros ) THEN
        zero <= '1';
    ELSE
        zero <= '0';
    END IF;

    CASE ALUControl is 
        when "0010" =>
            IF ( ( s_A = '0' AND s_B = '0' AND s_C = '1' ) OR ( s_A = '1' AND s_B = '1' AND s_C = '0' ) ) THEN
                overflow <= '1';
            ELSE
                overflow <= '0';
            END IF;
        when "0110" =>
            IF ( ( s_A = '0' AND s_B = '1' AND s_C = '1' ) OR ( s_A = '1' AND s_B = '0' AND s_C = '0' ) ) THEN
                overflow <= '1';
            ELSE
                overflow <= '0';
            END IF;
        when others => null;
            overflow <= '0';
    END CASE;
    
    C <= C_internal;
    
   END PROCESS; 


   ----------------------------------    

END behav;

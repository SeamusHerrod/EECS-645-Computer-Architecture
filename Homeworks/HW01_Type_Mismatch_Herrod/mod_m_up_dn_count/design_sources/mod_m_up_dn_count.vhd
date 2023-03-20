LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.my_package.ALL;

ENTITY mod_m_up_dn_count IS
	GENERIC (m : NATURAL := 16);
	PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
	      clk, rst	: IN	STD_LOGIC;
	      count	    : OUT	STD_LOGIC_VECTOR(n_bits_of(m) - 1 DOWNTO 0)
	     );
END mod_m_up_dn_count;

ARCHITECTURE behavioral OF mod_m_up_dn_count IS

   -- Internal signal declarations
   SIGNAL count_int : STD_LOGIC_VECTOR(count'length - 1 DOWNTO 0) := (OTHERS => '0');

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
    count <= count_int;
    
    asynch_reset : PROCESS(clk, rst)
    BEGIN
        IF (rst = '1') THEN
                count_int <= (OTHERS => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (up_down = '1') THEN -- counting up
                IF (UNSIGNED(count_int) = m) THEN --when count reaches max value, reset count_int to zero, with size count_int'length
                    count_int <= STD_LOGIC_VECTOR(TO_UNSIGNED(0, count_int'length));
                ELSE -- if count_int not max value, increment count_int by 1
                    count_int <= STD_LOGIC_VECTOR(UNSIGNED(count_int) + 1);
                END IF;
            ELSE -- counting down
                IF (UNSIGNED(count_int)= 0) THEN --when count reaches lowest value, wrap around to max value 
                    count_int <= STD_LOGIC_VECTOR(TO_UNSIGNED(m, count_int'length));
                ELSE
                    count_int <= STD_LOGIC_VECTOR(UNSIGNED(count_int) - 1);
                END IF;
            END IF;
        END IF;
    END PROCESS;      
   ----------------------------------	

END behavioral;

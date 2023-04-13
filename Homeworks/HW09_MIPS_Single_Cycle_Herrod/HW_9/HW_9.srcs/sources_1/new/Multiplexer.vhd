LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

entity Multiplexer is
    Port ( SEL : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(n_bits_data - 1 downto 0);
           B : in STD_LOGIC_VECTOR(n_bits_data - 1 downto 0);
           X : out STD_LOGIC_VECTOR(n_bits_data - 1 downto 0)
           );
end Multiplexer;

architecture Behavioral of Multiplexer is

begin
    X <= A when ( SEL = '1' ) else B;
end Behavioral;

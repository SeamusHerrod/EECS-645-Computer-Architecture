LIBRARY ieee;
USE ieee.std_logic_1164.all;

package my_package is

	-- General MIPS Parameters --
	constant n_bits_address : natural := 32; -- 32 bits
	constant n_bits_data 	: natural := 32; -- 32 bits
   	constant zeros 		    : std_logic_vector(n_bits_data - 1 downto 0) := (others => '0');
   	constant ones 		    : std_logic_vector(n_bits_data - 1 downto 0) := (others => '1');
   	type mem_type is array(natural range <>) of std_logic_vector(n_bits_data - 1 downto 0);
   	   	
	-- Register File Parameters --
	constant reg_file_depth   : natural := 23; -- 23 registers
	constant reg_file_width   : natural := n_bits_data;
	constant initial_reg_file : mem_type(0 to reg_file_depth - 1) := (others => zeros);
	
	-- Utility Functions --
	function n_bits_of (X : in integer) return integer;

end package my_package;

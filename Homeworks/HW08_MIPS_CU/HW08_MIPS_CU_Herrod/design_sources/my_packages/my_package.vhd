LIBRARY ieee;
USE ieee.std_logic_1164.all;

package my_package is

	-- General MIPS Parameters --
	constant n_bits_address : natural := 32; -- 32 bits
	constant n_bits_data 	: natural := 32; -- 32 bits
	constant n_bits_instr 	: natural := 32; -- 32 bits
   	constant zeros 		: std_logic_vector(n_bits_data - 1 downto 0) := (others => '0');
   	constant ones 		: std_logic_vector(n_bits_data - 1 downto 0) := (others => '1');
   	type mem_type is array(natural range <>) of std_logic_vector(n_bits_data - 1 downto 0);
   	   	
	-- Register File Parameters --
	constant reg_file_depth   : natural := 23; -- 23 registers
	constant reg_file_width   : natural := n_bits_data;
	constant initial_reg_file : mem_type(0 to reg_file_depth - 1) := (others => zeros);

	-- Data Memory Parameters --
	constant data_mem_depth   : natural := 117; -- 117 registers
	constant data_mem_width   : natural := n_bits_data;
	constant initial_data_mem : mem_type(0 to data_mem_depth - 1) := (others => zeros);

   	-- Instruction Memory Parameters --
   	constant my_program_size : natural := 39; -- Number of instructions
   	constant instr_mem_depth   : natural := my_program_size;
	constant instr_mem_width   : natural := n_bits_instr;  
	constant my_program : mem_type(0 to instr_mem_depth - 1) :=   
	(
	"00111100000000010001000000000001",
	"00110100001100000000000000000000",
	"00111100000000010001000000000001",
	"00110100001101010000000001001100",
	"10001110101101010000000000000000",
	"00100100000100100000000000000001",
	"10101110000100100000000000000000",
	"10101110000100100000000000000100",
	"00100010101100011111111111111110",
	"10001110000100110000000000000000",
	"10001110000101000000000000000100",
	"00000010011101001001000000100000",
	"10101110000100100000000000001000",
	"00100010000100000000000000000100",
	"00100010001100011111111111111111",
	"00011110001000001111111111111001",
	"00111100000000010001000000000001",
	"00110100001001000000000000000000",
	"00000000000101010010100000100000",
	"00001100000100000000000000010110",
	"00100100000000100000000000001010",
	"00000000000000000000000000001100",
	"00000000000001000100000000100000",
	"00000000000001010100100000100000",
	"00111100000000010001000000000001",
	"00110100001001000000000010001001",
	"00100100000000100000000000000100",
	"00000000000000000000000000001100",
	"10001101000001000000000000000000",
	"00100100000000100000000000000001",
	"00000000000000000000000000001100",
	"00111100000000010001000000000001",
	"00110100001001000000000010000111",
	"00100100000000100000000000000100",
	"00000000000000000000000000001100",
	"00100001000010000000000000000100",
	"00100001001010011111111111111111",
	"00011101001000001111111111110110",
	"00000011111000000000000000001000"
	);

	-- ALU Parameters --
	constant n_bits_alu  : natural := n_bits_data;
	constant n_functions_alu : natural := 16;

	-- CU Parameters --
	constant opcode_start  : natural := 26;
	constant opcode_end    : natural := 31;
	constant funct_start   : natural := 0;
	constant funct_end     : natural := 5;	

	-- Utility Functions --
	function n_bits_of (X : in integer) return integer;

end package my_package;

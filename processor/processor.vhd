-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: processor.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		This is a register file
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/19/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY processor IS
	PORT (
		ref_clk : IN std_logic ;
		reset : IN std_logic
	);
END processor;

architecture behavior of processor is

-- ALU
component alu
	PORT(
		Func_in : IN std_logic_vector (5 DOWNTO 0);
		A_in : IN std_logic_vector (31 DOWNTO 0);
		B_in : IN std_logic_vector (31 DOWNTO 0);
		O_out : OUT std_logic_vector (31 DOWNTO 0);
		Branch_out : OUT std_logic;
		Jump_out : OUT std_logic
	);
end component;

-- control
component control
	PORT(
		clk : IN std_logic;
		instruction : IN std_logic_vector (31 DOWNTO 0);

		-- selecting rs or rd
		--RegDst: OUT std_logic;

		-- Branch is not used in this single cycle processor
		--Branch: OUT std_logic;

		-- write enable for regfile
		-- '0' if read, '1' if write
		RegWrite: OUT std_logic;

		-- func
		ALUControl: OUT std_logic_vector(5 DOWNTO 0);

		-- selecting sign extend of raddr_2
		-- '0' if raddr_2 result, '1' if sign extend result
		ALUSrc: OUT std_logic;

		-- write ebable for data memory
		-- '0' if not writing to mem, '1' if writing to mem
		MemWrite: OUT std_logic;

		-- selecting output data from memory OR ALU result
		-- '0' if ALU result, '1' if mem result
		MemToReg: OUT std_logic;

		-- to regfile
		-- operand A
		rs: OUT std_logic_vector(4 DOWNTO 0);

		-- operand B
		rt: OUT std_logic_vector(4 DOWNTO 0);

		-- write address
		rd: OUT std_logic_vector(4 DOWNTO 0);

		-- immediant, (rd+shamt+func)
		imm: OUT std_logic_vector(15 DOWNTO 0)
	);
end component;

-- rom

-- mux

-- pc

-- ram

-- regfile

-- sign extension


begin
	
	--connection goes here

end behavior;


-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: control_tb.vhd
-- Team: MIPS_R_US
-- Members:
--    Stefan Cao (ID# 79267250)
--    Ting-Yi Huang (ID# 58106363)
--    Nehme Saikali (ID# 89201494)
--    Linda Vang (ID# 71434490)
--
-- Description:
--    
-- History:
--    Date        Update Description            Developer
--  -----------   ----------------------      -------------
--  1/20/2016     Created                     TH, NS, LV, SC
--
-------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_tb is
end control_tb;

architecture behavior of control_tb is

COMPONENT processor
	PORT (
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

END COMPONENT;

	signal clk_tb, RegWrite_tb, ALUSrc_tb, MemWrite_tb, MemToReg_tb: std_logic;
	signal instruction_tb: std_logic_vector(31 DOWNTO 0);
	signal ALUControl_tb: std_logic_vector(5 DOWNTO 0);
	signal rs_tb, rt_tb, rd_tb: std_logic_vector(4 DOWNTO 0);
	signal imm_tb: std_logic_vector(15 DOWNTO 0);

	-- clock period definition
	constant clk_period : time := 10 ns;

begin
	control_tb: control port map (clk=>clk_tb, instruction=>instruction_tb,
		RegWrite=>RegWrite_tb, ALUControl=>ALUControl_tb, ALUSrc=>ALUSrc_tb,
		MemWrite=>MemWrite_tb, MemToReg=>MemToReg_tb, rs=>rs_tb, rt=>rt_tb
		rd=>rd_tb, imm=>imm_tb); 

	clk_process : process
		begin
			clk_tb <= '0';
			wait for clk_period/2;
			clk_tb <= '1';
			wait for clk_period/2;
		end process;

	tb:process
	begin
		
		-- code goes here
		
	end process;

end behavior;


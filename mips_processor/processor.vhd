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
--------------components-------------
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

		-- immediante, (rd+shamt+func)
		imm: OUT std_logic_vector(15 DOWNTO 0)
	);
end component;

-- rom: instruction memory
component rom
	PORT(
		addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataIO : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
end component;

-- mux
component mux
	port( 
		in0: in std_logic_vector(31 downto 0);
		in1: in std_logic_vector(31 downto 0);
		sel: in std_logic;
		outb: out std_logic_vector(31 downto 0)
	);
end component;

-- pc
component pc
	PORT (
			clk: in STD_LOGIC;
      		rst: in STD_LOGIC;
      		-- this is set to '1' if there is a branch
      		isBranch: in STD_LOGIC; 
			addr_in: in STD_LOGIC_VECTOR(31 DOWNTO 0);
			addr_out: out STD_LOGIC_VECtOR(31 DOWNTO 0)
	);
end component;

-- ram: data memory
component ram
	port (
		clk : IN std_logic;
		we : IN std_logic;
		addr : IN std_logic_vector(31 DOWNTO 0); 
		dataI : IN std_logic_vector(31 DOWNTO 0); 
		dataO : OUT std_logic_vector(31 DOWNTO 0)
	);
end component;

-- regfile
component regfile
	PORT (
		clk : IN std_logic ;
		rst_s : IN std_logic ; 
		we : IN std_logic ; -- write enable
		raddr_1 : IN std_logic_vector (4 DOWNTO 0); -- read address 1
		raddr_2 : IN std_logic_vector (4 DOWNTO 0); -- read address 2
		waddr : IN std_logic_vector (4 DOWNTO 0); -- write address
		rdata_1 : OUT std_logic_vector (31 DOWNTO 0); -- read data 1
		rdata_2 : OUT std_logic_vector (31 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector (31 DOWNTO 0) -- write data 1
	);
end component;

-- sign extension
component sign_extension
	PORT(
		immediate : IN std_logic_vector(15 DOWNTO 0);
		sign_extension_out : OUT std_logic_vector(31 DOWNTO 0)
	);
end component;

--------------signals------------------------
------------------pc signal------------------
signal pcbranch:			std_logic := '0';	-- set pcbranch to 0 because not branching
signal pcadder:				std_logic_vector (31 DOWNTO 0);
signal pcadderout:			std_logic_vector (31 DOWNTO 0);
----------------rom signal-------------------

---------------control signals---------------
signal cinstruction:		std_logic_vector (31 DOWNTO 0);
signal cregwrite:			std_logic;
signal calucontrol:			std_logic_vector (5 DOWNTO 0);
signal calusrc:				std_logic;
signal cmemwrite:			std_logic;
signal cmemtoreg:			std_logic;
signal crs, crt, crd:		std_logic_vector (4 DOWNTO 0);
signal cimm:				std_logic_vector (15 DOWNTO 0);
---------sign_extension signals--------------
signal signextendout:		std_logic_vector (31 DOWNTO 0);
-----------------mux1 signals----------------
signal mux1ina:	std_logic_vector (31 DOWNTO 0);
----------------alu signals------------------
signal operanda, operandb:	std_logic_vector (31 DOWNTO 0);
signal aluout:				std_logic_vector (31 DOWNTO 0);
signal aluresult:			std_logic_vector (31 DOWNTO 0);
signal alubranchout:		std_logic;
signal alujumpout:			std_logic;
-----------------mux2 signals----------------
signal mux2ina:	std_logic_vector (31 DOWNTO 0);
signal mux2out:				std_logic_vector (31 DOWNTO 0);

-------------------begin--------------------- 
begin
	pcx:			pc port map (clk=>ref_clk, rst=>reset, isBranch=>pcbranch, addr_in=>pcadder, addr_out=>pcadderout);

	romx:			rom port map (addr=>pcadderout, dataIO=>cinstruction);
	controlx:		control port map (clk=>ref_clk, instruction=>cinstruction, RegWrite=>cregwrite, ALUControl=>calucontrol, ALUSrc=>calusrc, MemWrite=>cmemwrite, MemToReg=>cmemtoreg, rs=>crs, rt=>crt, rd=>crd, imm=>cimm);
	signextensionx:	sign_extension port map (immediate=>cimm, sign_extension_out=>signextendout);
	regfilex:		regfile port map (clk=>ref_clk, rst_s=>reset, we=>cregwrite, raddr_1=>crs, raddr_2=>crt, waddr=>crd, rdata_1=>operanda, rdata_2=>mux1ina, wdata=>mux2out);
	mux1x:			mux port map (in0=>mux1ina, in1=>signextendout, sel=>calusrc, outb=>operandb);
	alux:			alu port map (Func_in=>calucontrol, A_in=>operanda, B_in=>operandb, O_out=>aluresult, Branch_out=>alubranchout, Jump_out=>alujumpout);
	ramx:			ram port map (clk=>ref_clk, we=>cmemwrite, addr=>aluresult, dataI=>mux1ina, dataO=>mux2ina);
	mux2:			mux port map (in0=>mux2ina, in1=>aluresult, sel=>cmemtoreg, outb=>mux2out);	
	

end behavior;


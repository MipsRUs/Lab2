-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: control.vhd
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

ENTITY control IS
	PORT (
		clk : IN std_logic;
		instruction : IN std_logic_vector (31 DOWNTO 0);

		-- selecting rs or rd
		--RegDst: OUT std_logic;

		-- write enable for regfile
		RegWrite: OUT std_logic;

		-- func
		ALUControl: OUT std_logic_vector(5 DOWNTO 0);

		-- selecting sign extend of raddr_2
		ALUSrc: OUT std_logic;

		-- write ebable for data memory
		MemWrite: OUT std_logic;

		-- selecting output data from memory OR ALU result
		MemToReg: OUT std_logic

		-- to regfile
		rs: OUT std_logic_vector(4 DOWNTO 0);
		rt: OUT std_logic_vector(4 DOWNTO 0);
		rd: OUT std_logic_vector(4 DOWNTO 0)
		imm: OUT std_logic_vector(15 DOWNTO 0)
	);
END control;

architecture behavior of control is

begin

	funct: process(clk, instruction)


	begin

		if(clk'event and clk='1') then

			-- func
			
			imm <= instruction(15 DOWNTO 0);
			rs <= instruction(25 DOWNTO 21);
			rt <= instruction(20 DOWNTO 16);
			rd <= instruction(15 DOWNTO 11);

			RegWrite <= '1';




			-- R-type
			if((instruction(31 DOWNTO 26)= "000000") and (instruction (5 DOWNTO 4) = "10")) then
				ALUControl <= instruction(5 DOWNTO 0);
				MemWrite <= '0';
				MemToReg <= '0';

				-- i-type
				if((instruction(5 DOWNTO 0)="100001" OR instruction(5 DOWNTO 0))) then
					ALUSrc <= '1';

				-- r-type
				else
					ALUSrc <= '0'; 
				end if;



				

			-- Load instruction
			else if (instruction(31 DOWNTO 26)="100011") then 
				ALUControl <= "100000";
				MemWrite <= '0';
				MemToReg <= '1';
				ALUSrc <= '1'; 

			-- Store instruction
			else if(instruction(31 DOWNTO 26)="101011") then
				ALUControl <= "100000";	
				MemWrite <= '1';
				MemToReg <= '1';
				ALUSrc <= '1'; 
				
			end if;

		end if;

	end process;

end behavior;


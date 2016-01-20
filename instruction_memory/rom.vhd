-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: rom.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		this instruction mememory (32x2^32) is for an ALU 32-bit
--		should get an address from program counter and output
--			an instruction
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/16/2016		Created						TH, NS, LV, SC
--	1/16/2016		Not sure if working,		SC
--						not getting correct
--						waveform
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY rom is
	PORT(

		-- write_enable is only used to test, instead of having to 
		-- 		preload memory, delete it later
		write_enable : IN STD_LOGIC;

		addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataIO : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0)

	);
END rom;

ARCHITECTURE behavior of rom is
subtype word is std_logic_vector(31 DOWNTO 0);

--should be 2**32-1 but get overflow
type mem is array (0 to (2**16)-1) of word;

begin
	rom_process: process (write_enable, addr, dataIO)
	variable mem1:mem;
	begin

		-- will not use write_enable when using 'preload'
		if(write_enable='1') then
			mem1(to_integer(unsigned(addr))) := dataIO;
		else
			dataIO <= mem1(to_integer(unsigned(addr)));
		end if;
	end process;
end behavior;








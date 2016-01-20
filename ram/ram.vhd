-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: ram.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		This is a RAM
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/16/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ram IS port (
	GENERIC (NBIT: INTEGER := 32;
		NSEL: INTEGER := 9);

	clk : IN std_logic;
	we : IN std_logic;
	addr : IN std_logic_vector(NSEL-1 DOWNTO 0); 
	dataI : IN std_logic_vector(NBIT-1 DOWNTO 0); 
	dataO : OUT std_logic_vector(NBIT-1 DOWNTO 0));
END ram;

architecture behavior of ram is
subtype word is std_logic_vector(NBIT-1 DOWNTO 0);

-- change this depending of the size of the RAM
type mem is array (0 to (2**NSEL)-1) of word;

begin
	ram_process: process (clk, we, addr, dataI, dataO)
	variable mem1; mem;
	begin
	if(clk'event and clk='1') then
		if(we='1') then
			mem1(to_integer(unsigned(addr))) := dataI;
		else
			dataO <= mem1(to_integer(unsigned(addr)));
		end if;
	end if;

	end process;
end behavior;





-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: rom_tb.vhd
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
--
-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_tb is 
end rom_tb;

architecture behavior of rom_tb is
	COMPONENT rom
	port(



    	addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataIO : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	-- inputs


	signal addr_tb: STD_LOGIC_VECTOR(31 downto 0);
	signal dataIO_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);


begin
	inst1: rom port map (addr=>addr_tb, 
		dataIO=>dataIO_tb);

	TB: PROCESS
	BEGIN
		
		addr_tb <= "00000000000000000000000000000000";
		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000001";
		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000010";
		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000011";


		wait for 10 ns;

		

   end process;

end;

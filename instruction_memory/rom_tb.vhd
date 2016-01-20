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

		-- will not use write_enable later, delete later
    	write_enable: in STD_LOGIC;

    	addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		dataIO : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	-- inputs
	-- will not have this later
	signal write_enable_tb: STD_LOGIC;

	signal addr_tb: STD_LOGIC_VECTOR(31 downto 0);
	signal rom_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);


begin
	inst1: rom port map (write_enable=>write_enable_tb, addr=>addr_tb, rom=>rom_tb);

	TB: PROCESS
	BEGIN
		
		-- 'preloading like this for now'
		write_enable_tb <= '1';
		addr_tb <= (others=>'0');
		rom_tb <= "00000000000000000111111111111111";

		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000001";
		rom_tb <= "11111111111111111111111111111111";

		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000010";
		rom_tb <= "11111111111111111100000000000000";

		wait for 10 ns;


		-- reading from instruction memory
		write_enable_tb <= '0';
		addr_tb <= (others=>'0');

		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000001";

		wait for 10 ns;

		addr_tb <= "00000000000000000000000000000010";

		wait for 20 ns;


		

   end process;

end;

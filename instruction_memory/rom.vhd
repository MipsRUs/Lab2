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

-- SC 2016-01-22: Added
use STD.TEXTIO.all;
use IEEE.NUMERIC_STD_UNSIGNED.all;

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

begin
process is
file mem_file: TEXT;
variable L: line;
variable ch: character;
variable i, index, result: integer;

subtype word is std_logic_vector(31 DOWNTO 0);

--should be 2**32-1 but get overflow
type mem is array (0 to (2**16)-1) of word;
variable mem1: mem;
begin
-- initialize memory from file
for i in 0 to 63 loop -- set all contents low
mem(i) := (others => '0');
end loop;

index := 0;
FILE_OPEN (mem_file, "memfile.dat", READ_MODE);
while not endfile(mem_file) loop
readline(mem_file, L);
result := 0;

for i in 1 to 8 loop
	read (L, ch);
	if '0' <= ch and ch <= '9' then
	result := character'pos(ch) - character'pos('0');
	elsif 'a' <= ch and ch <= 'f' then
	result := character'pos(ch) - character'pos('a')+10;
	else report "Format error on line" & integer'
	image(index) severity error;
	end if;
	mem(index)(35-i*4 downto 32-i*4) := to_std_logic_vector(result,4);
	end loop;
	index := index + 1;
end loop;



begin
	rom_process: process (write_enable, addr, dataIO)
	--variable mem1:mem;
	begin

		-- will not use write_enable when using 'preload'
		if(write_enable='1') then
			mem1(to_integer(unsigned(addr))) := dataIO;
		else
			dataIO <= mem1(to_integer(unsigned(addr)));
		end if;
	end process;
end behavior;








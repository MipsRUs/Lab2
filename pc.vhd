-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- Description:
--		Program Counter for ALU_32_Bit
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/13/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY pc IS
PORT (clk: in STD_LOGIC ;
      rst: in STD_LOGIC ;
      
      addr: inout STD_LOGIC_VECTOR(31 DOWNTO 0);
      adderio: inout STD_LOGIC_VECTOR(31 DOWNTO 0));
end;
      
architecture logic of pc is
begin


adderio <= (std_logic_vector(to_unsigned((1), 32))) xor addr;

end architecture;
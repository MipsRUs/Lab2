-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: pctb.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
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
	GENERIC (NBIT: INTEGER := 32;
				STEP: INTEGER := 1);
	PORT (clk: in STD_LOGIC ;
      		rst: in STD_LOGIC ;
      		isBranch: in STD_LOGIC;  -- this is set to '1' if there is a branch
 
 	-- SC 2016-01-15: commented out 	     
    --addr: inout STD_LOGIC_VECTOR(31 DOWNTO 0);
    --adderio: inout STD_LOGIC_VECTOR(31 DOWNTO 0));
	
	addr_in: in STD_LOGIC_VECTOR(31 DOWNTO 0);
	addr_out: out STD_LOGIC_VECtOR(31 DOWNTO 0));

end pc;
      
architecture logic of pc is
begin

	-- SC 2016-01-15: Added the following code 
	PROCESS (clk)
		VARIABLE temp : std_logic_vector (0 to NBIT-1);		--defining variable temp (used as temporary storage)
	BEGIN
		if(clk'event and clk='1') THEN
			if (rst='1') THEN										-- synchronous reset
				L1: for i in addr_in'RANGE LOOP
					temp(i):='0';
				end loop;
			elsif (isBranch='1') THEN								-- load values from din to temp
				temp := addr_in;
			else										-- ascending (counting up)
				temp := std_logic_vector(unsigned(temp)+STEP);
			end if;
		end if;
		
	dout <= temp;														-- output the values
	end process;










-- SC 2016-01-15: commented out 
--adderio <= (std_logic_vector(to_unsigned((1), 32))) xor addr;

-- SC 2016-01-15: changed 'architecture' to 'logic'
end logic;






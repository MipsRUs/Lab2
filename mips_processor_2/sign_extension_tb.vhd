-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: sign_extension_tb.vhd
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
--	1/18/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extension_tb is
  
end sign_extension_tb;

architecture behavior of sign_extension_tb is

	COMPONENT sign_extension
		PORT(
			immediate : IN std_logic_vector(14 DOWNTO 0);
			sign_extension_out : OUT std_logic_vector(31 DOWNTO 0)
		);
	END COMPONENT;

	-- inputs
	signal immediate_tb: std_logic_vector(14 DOWNTO 0);
	signal sign_extension_out_tb:  std_logic_vector(31 DOWNTO 0);

	BEGIN

		sign_extension_inst: sign_extension PORT MAP(immediate=>immediate_tb, 
			sign_extension_out=>sign_extension_out_tb);

		TB: PROCESS
		BEGIN

		--test code goes here

		end process;
end;
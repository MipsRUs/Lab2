-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: control_tb.vhd
-- Team: MIPS_R_US
-- Members:
--    Stefan Cao (ID# 79267250)
--    Ting-Yi Huang (ID# 58106363)
--    Nehme Saikali (ID# 89201494)
--    Linda Vang (ID# 71434490)
--
-- Description:
--    
-- History:
--    Date        Update Description            Developer
--  -----------   ----------------------      -------------
--  1/20/2016     Created                     TH, NS, LV, SC
--
-------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_tb is
end control_tb;

architecture behavior of control_tb is

COMPONENT processor
	PORT (
	
	);

END COMPONENT;

	--signal stuff goes here


begin
	--processor_tb: processor port map (ref_clk=>ref_clk_tb, reset=>reset_tb); 

	tb:process
	begin
		
		-- code goes here
		
	end process;

end behavior;


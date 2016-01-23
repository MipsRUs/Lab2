-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: processor_tb.vhd
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
--  1/19/2016     Created                     TH, NS, LV, SC
--
-------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processor_tb is
end processor_tb;

architecture behavior of processor_tb is

COMPONENT processor
	PORT (
		ref_clk : IN std_logic ;
		reset : IN std_logic
	);

END COMPONENT;
-----signals-----

signal ref_clk_tb, reset_tb: std_logic;


begin
	processor_tb: processor port map (ref_clk=>ref_clk_tb, reset=>reset_tb); 

clk_pc:process
	begin
		ref_clk_tb <= '0';
		loop
			wait for 10 ns;
				ref_clk_tb <= not ref_clk_tb;
		end loop;
	end process;

-- need to put reset in here
--tb:process
--	begin
		
		-- code goes here
--go this from pc_tb------------------------------
TB: PROCESS
	BEGIN
		
		--resetting to 0's
		reset_tb <= '1';

		wait for 10 ns;
		
		reset_tb <= '0';
		wait for 100 ms;
end process;
---------------------------------------------------		
	

end behavior;


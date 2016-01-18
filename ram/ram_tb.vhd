-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: ram_tb.vhd
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
--  1/16/2016     Created                     TH, NS, LV, SC
--
-------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_tb is
  
end ram_tb;

architecture behavior of ram_tb is

	COMPONENT ram
		GENERIC (NBIT : INTEGER := 32;
			NSEL: INTEGER := 9);
		PORT (
			clk : IN std_logic;
			we : IN std_logic;
			addr : IN std_logic_vector(NSEL-1 DOWNTO 0); 
			dataI : IN std_logic_vector(NBIT-1 DOWNTO 0); 
			dataO : OUT std_logic_vector(NBIT-1 DOWNTO 0)
		);
	END COMPONENT;

	-- inputs
	signal clk_tb: std_logic;
	signal we_tb: std_logic;
	signal addr_tb: std_logic_vector(NSEL-1 DOWNTO 0);
	signal dataI_tb: std_logic_vector(NBIT-1 DOWNTO 0);
	signal dataO_tb: std_logic_vector(NBIT-1 DOWNTO 0);



	BEGIN

		ram_inst: ram PORT MAP(clk=>clk_tb, we=>we_tb, 
			addr=>addr_tb, dataI=>dataI_tb, dataO_tb=>dataO_tb);

		TB: PROCESS
		BEGIN

		--test code goes here

		end process;
end;






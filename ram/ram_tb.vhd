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
	GENERIC ( NBIT : INTEGER := 32);
	PORT (
		clk : IN std_logic;
		we : IN std_logic;
		addr : IN std_logic_vector(NBIT-1 DOWNTO 0); 
		dataI : IN std_logic_vector(NBIT-1 DOWNTO 0); 
		dataO : OUT std_logic_vector(NBIT-1 DOWNTO 0)
	);
END COMPONENT;


-- continue.....




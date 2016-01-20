-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: alu_tb.vhd
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

entity alu_tb is
end alu_tb;

architecture behavior of alu_tb is

COMPONENT alu
	GENERIC ( NBIT : INTEGER := 32;
		NSEL : INTEGER := 5);

	PORT (
	Func_in : IN std_logic_vector (5 DOWNTO 0);
	A_in : IN std_logic_vector (31 DOWNTO 0);
	B_in : IN std_logic_vector (31 DOWNTO 0);
	O_out : OUT std_logic_vector (31 DOWNTO 0);
	Branch_out : OUT std_logic;
	Jump_out : OUT std_logic
	);
END COMPONENT;

	signal Branch_out_tb, Jump_out_tb: std_logic;
	signal Func_in_tb: std_logic_vector(5 DOWNTO 0);  
	signal A_in_tb, B_in_tb, O_out_tb : std_logic_vector(31 downto 0);

begin
	alu_tb: alu port map (Func_in=>Func_in_tb, A_in=>A_in_tb, B_in=>B_in_tb,
			O_out=>O_out_tb, Branch_out=>Branch_out_tb, Jump_out=>Jump_out_tb); 

	tb:process
	begin
		
		-- code goes here
		
	end process;

end behavior;


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

	tb:process(Func_in, A_in, B_in)
	begin
		--first try

		A_in <= "00000000000000000000000000000001";
		B_in <= "00000000000000000000000000000011";
		
		--add
		Func_in <= "100000";
		wait for 10 ns;
		
		--sub
		Func_in <= "100010";
		wait for 10 ns;
		
		--and
		Func_in <= "100100";
		wait for 10 ns;
		
		--or
		Func_in <= "100101";
		wait for 10 ns;
		
		--xor
		Func_in <= "100110";
		wait for 10 ns;
		
		--nor
		Func_in <= "100111";
		wait for 10 ns;
		
		--slt signed
		Func_in <= "101000";
		wait for 10 ns;
		
		--slt unsigned
		Func_in <= "101001";
		wait for 10 ns;
		
		
		
		--second try
		
		A_in <= "00000000000000000000000000010000";
		B_in <= "00000000000000000000000000000001";
		
		--add
		Func_in <= "100000";
		wait for 10 ns;
		
		--sub
		Func_in <= "100010";
		wait for 10 ns;
		
		--and
		Func_in <= "100100";
		wait for 10 ns;
		
		--or
		Func_in <= "100101";
		wait for 10 ns;
		
		--xor
		Func_in <= "100110";
		wait for 10 ns;
		
		--nor
		Func_in <= "100111";
		wait for 10 ns;
		
		--slt signed
		Func_in <= "101000";
		wait for 10 ns;
		
		--slt unsigned
		Func_in <= "101001";
		wait for 10 ns;
		
	end process;

end behavior;


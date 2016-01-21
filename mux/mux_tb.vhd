-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: mux_tb.vhd
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

entity mux_tb is
  
end mux_tb;

architecture behavior of mux_tb is

	COMPONENT mux
		port( 
			in0: in std_logic_vector(31 downto 0);
			in1: in std_logic_vector(31 downto 0);
			sel: in std_logic;
			outb: out std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	-- inputs
	signal sel_tb: std_logic;
	signal in0_tb, in1_tb, outb_tb: std_logic_vector(31 downto 0);



	BEGIN

		mux_inst: mux PORT MAP(in0=>in0_tb, in1_tb=>in1_tb, sel=>sel_tb, 
			outb=>outb_tb);

		TB: PROCESS
		BEGIN

		in0_tb <= "00000000111111110000000011111111";
		in1_tb <= "11111111111111110000000000000000";
		sel_tb <= '0';

		wait for 10 ns;

		sel_tb <= '1';

		wait for 10 ns;
	

		end process;
end;






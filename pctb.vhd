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
--		Test Bench for Program Counter
--
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/13/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity pc_tb is 
end pc_tb;
architecture behavior of pc_tb is
COMPONENT pc
port(
      clk: in STD_LOGIC ;
      rst: in STD_LOGIC ;
      
      addr: inout STD_LOGIC_VECTOR(31 DOWNTO 0);
      adderio: inout STD_LOGIC_VECTOR(31 DOWNTO 0)
);
end component;
signal clktb: std_logic := '0';
signal rsttb: STD_LOGIC;
signal addrtb: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal adderiotb: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
inst1: pc port map (clk=>clktb, rst=>rsttb,addr=>addrtb,adderio=>adderiotb);
clk_pc: process
	begin
		clktb <= '0';
		loop
			wait for 10 ns;
				clktb <= not clktb;
		end loop;
	end process;
tb: process
begin
wait for 20 ns;
rsttb <= '1';

wait for 10 ns;
rsttb <= '0';

end process;
end behavior;

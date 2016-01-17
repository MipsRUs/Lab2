-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: regfile.vhd
-- Team: MIPS_R_US
-- Members:
-- 		Stefan Cao (ID# 79267250)
--		Ting-Yi Huang (ID# 58106363)
--		Nehme Saikali (ID# 89201494)
--		Linda Vang (ID# 71434490)
--
-- Description:
--		
-- History:
-- 		Date		Update Description			Developer
--	-----------   ----------------------   	  -------------
--	1/16/2016		Created						TH, NS, LV, SC
--
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY regfile IS
	GENERIC ( NBIT : INTEGER := 32;
		NSEL : INTEGER := 3);
	PORT (
		clk : IN std_logic ;
		rst_s : IN std_logic ; -- synchronous reset
		we : IN std_logic ; -- write enable
		raddr_1 : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 1
		raddr_2 : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- read address 2
		waddr : IN std_logic_vector ( NSEL -1 DOWNTO 0); -- write address
		rdata_1 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 1
		rdata_2 : OUT std_logic_vector ( NBIT -1 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector ( NBIT -1 DOWNTO 0) -- write data 1
	);
END regfile ;

architecture behavior of regfile is

subtype word is std_logic_vector(NBIT-1 downto 0);
type regFileTyp is array(0 to 2**NSEL-1) of word;


begin  
  funct: process(clk)
    variable mem:regFileTyp;
    variable RDATA1_VAR, RDATA2_VAR : STD_LOGIC_VECTOR(NBIT-1 downto 0);
    begin
    if(clk'event and clk='1' and rst_s='1') then
     all_zero: for i in 0 to 2**NSEL-1 loop
        mem(i) := (others=>'0');
      end loop;  -- i
      rdata1_var := (others =>'0');
      rdata2_var := (others =>'0');
    elsif (clk'event and clk='1') then
      rdata1_var := mem(to_integer(unsigned(raddr_1)));
      rdata2_var := mem(to_integer(unsigned(raddr_2)));
      if (we='1') then
        mem(to_integer(unsigned(waddr))) := wdata;
      end if;
    end if;
    rdata_1 <= rdata1_var;
    rdata_2 <=rdata2_var;
    end process;
end behavior;







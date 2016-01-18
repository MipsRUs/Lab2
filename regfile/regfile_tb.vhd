-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: regfile.vhd
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

entity regfile_tb is
  
end regfile_tb;

architecture behavior of regfile_tb is

COMPONENT regfile
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
END COMPONENT;


 signal clk, rst_s, we: std_logic;  
 signal raddr1, raddr2, waddr: std_logic_vector(2 downto 0);
 signal rdata1, rdata2, wdata : std_logic_vector(31 downto 0);

begin   --beh
  resgister1: regfile generic map (NBIT => 32,NSEL =>3) port map (clk, rst_s, we, raddr1, raddr2, waddr, rdata1, rdata2, wdata);
    clk_pc: process
      begin
        clk <='0';
        loop
          wait for 10 ns;
           clk <= not clk;
        end loop;
       
      end process;
      

    tb:process
      begin
        
      -- code goes here
        
      end process;
  

end behavior;





-------------------------------------------------------------------
-- Copyright MIPS_R_US 2016 - All Rights Reserved 
--
-- File: regfile_tb.vhd
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
		NSEL : INTEGER := 5);

	PORT (
		clk : IN std_logic ;
		rst_s : IN std_logic ; -- synchronous reset
		we : IN std_logic ; -- write enable
		raddr_1 : IN std_logic_vector (NSEL-1 DOWNTO 0); -- read address 1
		raddr_2 : IN std_logic_vector (NSEL-1 DOWNTO 0); -- read address 2
		waddr : IN std_logic_vector (NSEL-1 DOWNTO 0); -- write address
		rdata_1 : OUT std_logic_vector (NBIT-1 DOWNTO 0); -- read data 1
		rdata_2 : OUT std_logic_vector (NBIT-1 DOWNTO 0); -- read data 2
		wdata : IN std_logic_vector (NBIT-1 DOWNTO 0) -- write data 1
	);
END COMPONENT;


	signal clk_tb, rst_s_tb, we_tb: std_logic;  
	signal raddr1_tb, raddr2_tb, waddr_tb: std_logic_vector(4 downto 0);
	signal rdata1_tb, rdata2_tb, wdata_tb : std_logic_vector(31 downto 0);

begin
	regfile_tb: regfile port map (clk=>clk_tb, rst_s=>rst_s_tb, we=>we_tb, 
			raddr1=>raddr1_tb, raddr2=>raddr2_tb, waddr=>waddr_tb, 
			rdata1=>rdata1_tb, rdata2=>rdata2_tb, wdata=>wdata_tb);

	clk_pc: process
	begin
		clk_tb <='0';
		loop
		wait for 10 ns;
			clk_tb <= not clk;
		end loop;
	end process;  

	tb:process
	begin
		-- resetting regfile
		rst_s_tb <= '1';
		wait for 50 ns;

		-- setting register address 
		raddr1_tb <= "01011";
		raddr2_tb <= "11001";
		rst_s_tb <= '0';

		-- not writing to regfile, reading from it first
		we_tb <= '0';

		wait for 20 ns;

		waddr_tb <= "01011";
		wdata_tb <= "00011111111110110001111111111010";

		wait for 10 ns;

		-- writing to regfile
		we_tb <= '1';

		wait for 50 ns;

		waddr_tb <= "11001";
		wdata_tb <= "00000000000000000000000000111110"; 

		wait for 50 ns;

		we_tb <= '0';

		wait for 50 ns;

	end process;

end behavior;


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

    	-- SC 2016-01-16: Added
    	isBranch: in STD_LOGIC
      
     	-- SC 2016-01-16: Added
    	addr_in: in STD_LOGIC_VECTOR(31 DOWNTO 0);
		addr_out: out STD_LOGIC_VECTOR(31 DOWNTO 0)

    	-- SC 2016-01-16: Commented out
    	--addr: inout STD_LOGIC_VECTOR(31 DOWNTO 0);
    	--adderio: inout STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	end component;

	-- inputs
	signal clk_tb: STD_LOGIC := '0';
	signal rst_tb: STD_LOGIC := '0';

	-- isBranch will stay '0' in this processor implementation
	signal isBranch_tb: STD_LOGIC := '0';

	-- SC 2016-01-16: Added
	signal addr_in_tb: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	-- SC 2016-01-16: Commented out
	--signal addrtb: STD_LOGIC_VECTOR(31 DOWNTO 0);
	--signal adderiotb: STD_LOGIC_VECTOR(31 DOWNTO 0);

	-- outputs
	signal addr_out_tb: STD_LOGIC_VECTOR(31 downto 0);

	-- clock period definition
	constant clk_period : time := 10 ns;


begin
	inst1: pc port map (clk=>clk_tb, rst=>rst_tb,isBranch=>isBranch_tb, addr_in=>addr_in_tb, addr_out=>addr_out_tb);
	
	clk_process : process
		begin
			clk_tb <= '0';
			wait for clk_period/2;
			clk_tb <= '1';
			wait for clk_period/2;
		end process;


	TB: PROCESS
	BEGIN
		
		--resetting to 0's
		rst_tb <= '1';
		wait for 10ns;
		
		rst_tb <= '0';
		wait for 10ns;

		rst_tb <= '0';
		wait for 10ns;

		rst_tb <= '0';
		wait for 10ns;

		rst_tb <= '0';
		wait for 10ns;

		rst_tb <= '0';
		wait for 10ns;
		
		-- resetting to 0's
		rst_tb <= '1';
		wait for 10ns;

		rst_tb <= '0';
		wait for 10ns;

		rst_tb <= '0';
		wait for 10ns;


	
		addr_in_tb <= "00000000000000000111111111111111";
		isBranch_tb <='1';
		wait for 10ns;
		
		
		wait for 60ns;

   end process;



	-- SC 2016-01-16: Commented out
	--clk_pc: process
	--	begin
	--		clktb <= '0';
	--	loop
	--		wait for 10 ns;
	--			clktb <= not clktb;
	--	end loop;
	--end process;


	-- SC 2016-01-16: Commented out
	--tb: process
	--begin
	--wait for 20 ns;
	--rsttb <= '1';

	--wait for 10 ns;
	--rsttb <= '0';

	--end process;
end behavior;

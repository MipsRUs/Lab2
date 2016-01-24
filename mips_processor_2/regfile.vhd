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
--		This is a register file
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

--ENTITY regfile IS
--	-- TH commented generic for processor
--	--GENERIC (
--	--	NBIT: INTEGER := 32;

--		-- NSEL may be changes, not sure how many registers there are
--	--	NSEL : INTEGER := 5);

--	PORT (
--		clk : IN std_logic ;
--		rst_s : IN std_logic ; 
--		we : IN std_logic ; -- write enable
--		raddr_1 : IN std_logic_vector (4 DOWNTO 0); -- read address 1
--		raddr_2 : IN std_logic_vector (4 DOWNTO 0); -- read address 2
--		waddr : IN std_logic_vector (4 DOWNTO 0); -- write address
--		rdata_1 : OUT std_logic_vector (31 DOWNTO 0); -- read data 1
--		rdata_2 : OUT std_logic_vector (31 DOWNTO 0); -- read data 2
--		wdata : IN std_logic_vector (31 DOWNTO 0) -- write data 1
--	);
--END regfile ;

--architecture behavior of regfile is

--subtype word is std_logic_vector(31 downto 0);
--type memory is array(0 to 2**4) of word;


--begin
--	funct: process(clk)
--	variable mem_var:memory;
--	variable rdata1_var, rdata2_var : STD_LOGIC_VECTOR(31 downto 0);

--	begin
--	if(clk'event and clk='1') then

--		-- if reset is '1', make all registers in regfile to be 0's 
--		if(rst_s='1') then

--			-- going through every regfile
--			reg_loop: for i in 0 to 2**4 loop
--				mem_var(i) := (others=>'0');
--			end loop; 

--			-- output rdata1 and rdata2 as 0's
--			rdata1_var := (others =>'0');
--			rdata2_var := (others =>'0');

--		else 

--			-- get data from regfile and put them into rdata_1 and rdata_2
--			rdata1_var := mem_var(to_integer(unsigned(raddr_1)));
--			rdata2_var := mem_var(to_integer(unsigned(raddr_2)));

--			-- if write enable, write to regfile
--			if (we='1') then
--				mem_var(to_integer(unsigned(waddr))) := wdata;
--			end if;
--		end if;
--	end if;
--	rdata_1 <= rdata1_var;
--	rdata_2 <=rdata2_var;
--	end process;

--end behavior;

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

architecture beh of regfile is
--type memory is array (natural range <>, natural range <>) of std_logic;
--signal mem1: memory(2**NSEL-1 downto 0, NBIT-1 downto 0);

subtype word is std_logic_vector(NBIT-1 downto 0);
type regFileTyp is array(0 to 2**NSEL-1) of word;
--signal reg: regFileType;

begin  -- beh
  funct: process(clk)
    variable mem1:regFileTyp;
    variable RDATA1_VAR, RDATA2_VAR : STD_LOGIC_VECTOR(NBIT-1 downto 0);
    begin
    if(clk'event and clk='1' and rst_s='1') then
     all_zero: for i in 0 to 2**NSEL-1 loop
        mem1(i) := (others=>'0');
      end loop;  -- i
      rdata1_var := (others =>'0');
      rdata2_var := (others =>'0');
    elsif (clk'event and clk='1') then
      rdata1_var := mem1(to_integer(unsigned(raddr_1)));
      rdata2_var := mem1(to_integer(unsigned(raddr_2)));
      if (we='1') then
        mem1(to_integer(unsigned(waddr))) := wdata;
      end if;
    end if;
    rdata_1 <= rdata1_var;
    rdata_2 <=rdata2_var;
    end process;
end beh;



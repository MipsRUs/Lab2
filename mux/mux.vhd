library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.c31L_pack.all;
entity mux is
port( in0: in std_logic_vector(32-1 downto 0);
      in1: in std_logic_vector(32-1 downto 0);
      sel: in std_logic;
     outb: out std_logic_vector(32-1 downto 0)
);
end mux;

architecture arch of mux is
begin
process(in0, in1, sel)
begin
	if(sel = '0') then
		outb<= in0;
	else
		outb<= in1;
	end if;
end process;
end arch;
	

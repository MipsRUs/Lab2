--library IEEE;
--use IEEE.STD_LOGIC_1164.all; 
--use IEEE.std_logic_textio.all;
--use STD.TEXTIO.all;
--use IEEE.numeric_std.all;

----use IEEE.NUMERIC_STD_UNSIGNED.all;

--entity imem is -- instruction memory
--port(a: in STD_LOGIC_VECTOR(5 downto 0);
--rd: out STD_LOGIC_VECTOR(31 downto 0));
--end;

--architecture behave of imem is
--begin
--	read_file:
--	process 
--	file mem_file: TEXT;
--variable L: line;
--variable ch: character;
--variable i, index, result: integer;
--type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
--variable mem: ramtype;
--begin
---- initialize memory from file
--for i in 0 to 63 loop -- set all contents low
--mem(i) := (others => '0');
--end loop;

--index := 0;
--FILE_OPEN (mem_file, "memfile.dat", READ_MODE);
--while not endfile(mem_file) loop
--readline(mem_file, L);
--result := 0;

--for i in 1 to 8 loop
--	read (L, ch);
--	if '0' <= ch and ch <= '9' then
--	result := character'pos(ch) - character'pos('0');
--	elsif 'a' <= ch and ch <= 'f' then
--	result := character'pos(ch) - character'pos('a')+10;
--	else report "Format error on line" & integer'
--	image(index) severity error;
--	end if;
--	mem(index)(35-i*4 downto 32-i*4) := to_std_logic_vector(result,4);
--	end loop;
--	index := index + 1;
--end loop;
---- read memory
--loop
--rd <= mem(to_integer(a));
--wait on a;
--end loop;
--end process;
--end;






entity file_io is  -- test bench
end file_io;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

architecture test of file_io is
  signal done : std_logic := '0';  -- flag set when simulation finished
begin  -- test of file_io
  done <= '1' after 5 sec;        -- probably set via logic, not time

  read_file:
    process    -- read file_io.in (one time at start of simulation)
      file my_input : TEXT open READ_MODE is "imem.h";
      variable my_line : LINE;
      variable my_input_line : LINE;
    begin
      write(my_line, string'("reading file"));
      writeline(output, my_line);
      loop
        exit when endfile(my_input);
        readline(my_input, my_input_line);
        -- process input, possibly set up signals or arrays
        writeline(output, my_input_line);  -- optional, write to std out
      end loop;
      wait; -- one shot at time zero,
    end process;

  write_file:
    process (done) is    -- write file_io.out (when done goes to '1')
      file my_output : TEXT open WRITE_MODE is "file_io.out";
      -- above declaration should be in architecture declarations for multiple
      variable my_line : LINE;
      variable my_output_line : LINE;
    begin
      if done='1' then
        write(my_line, string'("writing file"));
        writeline(output, my_line);
        write(my_output_line, string'("output from file_io.vhdl"));
        writeline(my_output, my_output_line);
        write(my_output_line, done);    -- or any other stuff
        writeline(my_output, my_output_line);
      end if;
    end process;
end architecture test; -- of file_io









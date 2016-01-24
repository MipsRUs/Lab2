module processor_tb;
  logic ref_clk;
  logic reset;
  
processor L1(
          .ref_clk(ref_clk)
         ,.reset(reset)
         );

always begin
	#1 ref_clk = 1;
	#1 ref_clk = 0;
end

initial begin

	reset = 1;
	#4;
	reset = 0;
	#1000;

end
endmodule
    

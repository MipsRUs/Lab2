module processor_tb;
  logic ref_clk;
  logic reset;
  
processor L1(
          .ref_clk(ref_clk)
         ,.reset(reset)
         );

always begin
	#10 ref_clk = 1;
	#10 ref_clk = 0;
end

initial begin

	reset = 1;
	#50;
	reset = 0;
	#10000;

end
endmodule
    

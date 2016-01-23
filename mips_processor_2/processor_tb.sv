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
	#10;
	reset = 0;
	#100;

end
endmodule
    

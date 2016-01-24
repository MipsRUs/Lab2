module processor_tb;
  logic ref_clk;
  logic reset;
  
processor L1(
          .ref_clk(ref_clk)
         ,.reset(reset)
         );

always begin
	#100 ref_clk = 1;
	#100 ref_clk = 0;
end

initial begin

	reset = 1;
	#100;
	reset = 0;
	#100000;

end
endmodule
    

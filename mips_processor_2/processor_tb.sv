module processor_tb;
  logic ref_clk;
  logic reset;
  
processor L1(
          .ref_clk(ref_clk)
         ,.reset(reset)
         );

//always begin
	//#50 ref_clk = 1;
	//#50 ref_clk = 0;
//end

initial begin


	//ref_clk = 1'b0;
	//forever #50 ref_clk = ~ref_clk;


	//reset = 1;
	//#100;
	//reset = 0;

	ref_clk = 0;
	reset = 1;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10
	ref_clk = 0;
	reset = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;
	ref_clk = 1;
	#10;
	ref_clk = 0;
	#10;








end
endmodule
    

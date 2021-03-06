module processortb;
/* reg is for INPUT, wire is for OUTPUT*/
reg ref_clk_tb;
reg reset_tb;
processor L1 (.ref_clk(ref_clk_tb),.reset(reset_tb));

initial
begin

	ref_clk_tb = 1'b0;
	reset_tb = 1'b0;
	forever #10 ref_clk_tb <= ~ref_clk_tb; 

end
always
	begin
	#200 reset_tb <= 1'b0;

end
endmodule

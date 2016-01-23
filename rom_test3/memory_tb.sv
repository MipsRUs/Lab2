module memory_tb;
  logic[5:0] a;
  wire[31:0] rd;
  
memory L1(
          .a(a)
         ,.rd(rd)
         );

initial begin

        a = 6'b000000;
        #100;  
        a = 6'b000001;
        #100;
        a = 6'b000010;
        #100;
        a = 6'b000011;
        #100;
        a = 6'b000100;
        #100;
        a = 6'b000101;
        #100;

	   

end
endmodule
    

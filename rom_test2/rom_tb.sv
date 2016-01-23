module rom_tb;
  logic[31:0] addr;
  wire[31:0] dataOut;
  
rom L1(
          .addr(addr)
         ,.dataOut(dataOut)
         );

initial begin

        addr = 6'b00000000000000000000000000000000;
        #100;  
        addr = 6'b00000000000000000000000000000001;
        #100;
        addr = 6'b00000000000000000000000000000010;
        #100;
        addr = 6'b00000000000000000000000000000011;
        #100;
        addr = 6'b00000000000000000000000000000100;
        #100;
        addr = 6'b00000000000000000000000000000101;
        #100;

	   

end
endmodule
    
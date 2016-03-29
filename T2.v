module values(input CLOCK_50, 
	output [1:0]LED);
   
reg [32:0] counter;
reg ledON=0;
   
assign LED[0] = ledON;
assign LED[1] = ~ledON;
	
always @(posedge CLOCK_50) begin		
 if(counter == 50000000) begin
  ledON = ~ledON;
  counter = 0;
 end
 else begin
  counter <= counter+1;
 end
 end
   
endmodule
   
module test;
   
 reg clk;
 wire [1:0]led;
  
values adder(clk,
led);
   
always #1 clk = ~clk;
   
initial begin
  $dumpvars(0,adder);
  #0;
  clk <= 0;
  #400000000;
  $finish;   
 end
endmodule

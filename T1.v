
module Values(
    input clk,   
    output led
   );

  assign led = clk;

endmodule

module Test;

  reg clk;

       always #10 clk = ~clk;
	Values ja(clk, led);
  initial begin
    $dumpvars(0, ja);

    clk <=  0;
    
    #500;
    $finish;
  end
endmodule

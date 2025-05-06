`timescale 1ns / 1ps

module test_bench;

    parameter WIDTH = 8;
	 parameter CLK_PERIOD = 5;
    reg clk;
    reg signed [WIDTH-1:0] a, b, c, d;
    wire signed [2*WIDTH-1:0] y;

    // Instantiate the DUT
    test_task #(.WIDTH(WIDTH)) DUT (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
		  .CLK(clk),
        .y(y)
    );
	 
	 always #(CLK_PERIOD) clk = ~clk; 

    // Test cases
    initial begin
        // Initialize Inputs
        clk = 0;
        a = 0;
        b = 0;
        c = 0;
        d = 0;
		  #(CLK_PERIOD * 2);
		  
        // Test case 1
        a = 1; b = 1; c = 1; d = 1;
        // Expected: ((1-1)*(1+3*1)-4*1)/2 = -2
        #(CLK_PERIOD);
        if (y !== -2) $display("Test case 1 failed: y = %d, expected -2", y);

        // Test case 2
        a = 4; b = 3; c = 3; d = 1;
        // Expected: ((4-3)*(1+3*3)-4*1)/2 = 3
        #(CLK_PERIOD * 2);
        if (y !== 3) $display("Test case 2 failed: y = %d, expected 2", y);

        // Test case 3 - edge case with maximum values
        a = (2**(WIDTH-1))-1; b = 0; c = 0; d = 0;
        // Expected: ((MAX-0)*(1+0)-0)/2 = MAX/2
        #(CLK_PERIOD * 2);
        if (y !== a >>> 1) $display("Test case 3 failed: y = %d, expected 2", y);

    end

endmodule 
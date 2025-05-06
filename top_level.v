module test_task #(parameter WIDTH=8) 
						(input wire signed [WIDTH-1:0] a,b,c,d,
						 input CLK,
						 output reg signed [2*WIDTH-1:0] y);
			
			
		  // variables for calcullation 
			reg signed [WIDTH-1:0] a_b, one_plus_3c,_4d_;
			reg signed [2*WIDTH-1:0] mult;
			
			
			// Compute a - b, 1 + 3c, 4d, multiply (a - b) * (1 + 3c) and compute y
		  always @(posedge CLK)
				begin
						a_b = a - b;
						one_plus_3c = 1 + (3 * c);
						_4d_ = 4 * d;
						mult = a_b * one_plus_3c;
						y = (mult - _4d_) >>> 1;
				end
endmodule 
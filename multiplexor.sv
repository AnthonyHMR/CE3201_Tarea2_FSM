module multiplexor
(
	input [7:0] registro,
	input controller,
	output [7:0] state
);

	always_comb begin
		case(controller)
			1'b0:state <= registro;
			1'b1:state <= 8'hFF;
			
		endcase
	end

endmodule
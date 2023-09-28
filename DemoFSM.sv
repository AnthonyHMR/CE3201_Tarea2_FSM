module DemoFSM(input clk, rst, m, t, output rst_timer, mant);

logic [1:0] state, next_state;

//actual state logic
always_ff @(posedge clk or posedge rst)
	if (rst) state = 2'b00;
	else
		state = next_state;

//next state logic
always_comb
	case(state)
		2'b00: if (m) next_state = 2'b01;else next_state = 2'b10;
		2'b01: next_state = 2'b01;
		2'b10: if (t) next_state = 2'b11; else next_state = 2'b00;
		2'b11: next_state = 2'b11;
		default: next_state = 2'b00;
	endcase

//output logic

assign rst_timer = (state == 2'b01);
assign mant = (state == 2'b01);	

endmodule
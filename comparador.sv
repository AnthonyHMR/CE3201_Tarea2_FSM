module comparador
(
	input logic [7:0] count,
	output logic t0
);
	always @(posedge count) begin
		if (count >= 8'b11001000) begin
			t0 <= 1'b1;
		end else begin
			t0 <= 1'b0;
		end
	end
endmodule	
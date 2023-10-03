module timer
(
	input logic clk, rst_n, mant,
	output logic [7:0] out_count
	
);
   reg [7:0] count; // Contador de 8 bits
	integer i;

	always @(posedge clk or negedge rst_n or posedge mant) begin
     if (!rst_n) begin
       count <= 8'h00; // Reiniciar el contador en caso de restablecimiento
     end else begin
		 if (mant == 1'b1) begin
			count <= 8'h00;
		 end else begin
         if (i < 200) begin
           count <= count + 1; // Incrementar el contador en cada ciclo de reloj
           i <= i + 1; // Incrementar la variable de control
         end
       end
     end
	end
	assign out_count = count;
endmodule
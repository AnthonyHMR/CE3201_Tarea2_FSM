module RegistroMantenimiento (
    input logic clk,
    input logic reset,
    input logic enable,
    output reg [7:0] num_mante
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            num_mante <= 8'h00; // Se inicializa el número de mantenimientos a cero en caso de reset
        else if (enable)
            num_mante <= num_mante + 1; // Se incrementa el número de mantenimientos si enable es 1
    end

endmodule
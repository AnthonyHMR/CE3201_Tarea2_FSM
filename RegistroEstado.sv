module RegistroEstado (
    input logic clk,
    input logic reset,
    input logic [7:0] estado,
    output logic [7:0] estado_actual
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            estado_actual <= 8'h00; // Se establece el número de mantenimientos a cero en caso de reset
        else
            estado_actual <= estado; // El estado actual es igual al estado de entrada
    end

endmodule
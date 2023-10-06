module topLevel_tb;
    // Parámetros de simulación
    reg clk = 0;
    reg rst = 0;
    reg mant = 0;
    wire [7:0] state;

    // Instancia del módulo topLevel
    topLevel dut (
        .clk(clk),
        .rst(rst),
        .mant(mant),
        .state(state)
    );

    // Generación del reloj
    always #5 clk = ~clk;

    // Inicialización
    initial begin
        // Simulación de reset
        rst = 1;
        #10; // Esperar un tiempo
        rst = 0;

        // Simulación de operación normal
        mant = 0;
        #100; // Esperar un tiempo
        mant = 1;
        #50; // Esperar un tiempo
        mant = 0;
        #100; // Esperar un tiempo

        // Finalizar simulación
        $finish;
    end

    // Monitorear estado
    always @(posedge clk) begin
        $display("Tiempo: %0t, clk: %b, rst: %b, mant: %b, state: %h", $time, clk, rst, mant, state);
    end

endmodule
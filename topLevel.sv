module topLevel
(
	input logic clk, rst,
	input logic mant,
	output logic [7:0] state
);
	logic [7:0] tiempo, numMant, estado;
	logic t0, controller, isMant;
	
	timer							temporizador(clk, rst, mant, tiempo);
	comparador					comp 			(tiempo, t0);
	MaquinaSF					FSmachine	(clk, rst, mant, t0, controller, isMant);
	RegistroMantenimiento	regMant		(clk, rst, isMant, numMant);
	multiplexor					multplex		(numMant, controller, estado);
	RegistroEstado				regState		(clk, rst, estado, state);
endmodule
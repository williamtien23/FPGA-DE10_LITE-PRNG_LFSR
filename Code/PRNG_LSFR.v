/**
	@file : Encoder_BCD_3.v
	@author: William Tien
	@brief : Demo For LSFR PRNG
*/
module PRNG_LSFR (output [6:0] sseg_1, output [6:0] sseg_2, output [6:0] sseg_3, input i_clk, input button);

wire out_clock;
wire [7:0] number;
wire [11:0] stream;
reg [2:0] triple_flop_button = 2'b00;

	//Prescaler U1 (out_clock, i_clk);
	PRNG_8bit U2 (number, !triple_flop_button[1] && triple_flop_button[2]);
	
	Encoder_BCD_3 	U3 (stream, number);
	Decoder_7seg 	U4 (sseg_1, stream[3:0]);
	Decoder_7seg 	U5 (sseg_2, stream[7:4]);
	Decoder_7seg 	U6 (sseg_3, stream[11:8]);

	always @ (posedge i_clk)
	begin
		triple_flop_button [2] <= triple_flop_button [1];
		triple_flop_button [1] <= triple_flop_button [0];
		triple_flop_button [0] <= button;
	end

endmodule

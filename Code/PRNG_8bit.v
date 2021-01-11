/**
	@file : Encoder_BCD_3.v
	@author: William Tien
	@brief : 8 Bit Wide Pseudo Random Number Generator Using Linear Feedback Shift Registers
*/
module PRNG_8bit (o_number, i_clk);

output reg [7:0] o_number = 8'b10110101; //Initial value of 181 (Next = 218)
input i_clk;

reg in_sr;
wire [7:0] px = 8'b0011101; //x^4 + x^3 + x^2 + 1

always @ (*)
begin
in_sr = ^ (px [7:0] & o_number [7:0]); //bitwise xor reduction of the bitwise and between px and sx
end

//Shift Register
always @ (posedge i_clk)
begin
	o_number[6:0] <= o_number[7:1];
	o_number[7] <= in_sr;
end

endmodule


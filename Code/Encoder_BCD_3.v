/**
	@file : Encoder_BCD_3.v
	@author: William Tien
	@brief : Simple Encoder 3 Digit BCD
*/
	
module Encoder_BCD_3(output reg [11:0] BCD, input [7:0] BinaryInput);


	wire [7:0] quotient100;
	wire [7:0] remainder100;
	wire [7:0] quotient10;
	wire [7:0] remainder10;

	assign quotient100 = BinaryInput/'d100;
	assign remainder100 = BinaryInput%'d100;
	assign quotient10 = remainder100/'d10;
	assign remainder10 = BinaryInput%'d10;
	
	always @ (BinaryInput)
		begin
		
			BCD[11:8] = quotient100;
			BCD [7:4] = quotient10;
			BCD [3:0] = remainder10;
			
		end
		
endmodule
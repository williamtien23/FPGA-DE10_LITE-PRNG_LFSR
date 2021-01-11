`timescale 1ns/1ps
module PRNG_8bit_tb ();

reg in_clock;
wire [7:0] out_number;

PRNG_8bit DUT (out_number, in_clock);

initial
begin
in_clock = 0;
end

always
begin
#5 in_clock = !in_clock; 
end

endmodule

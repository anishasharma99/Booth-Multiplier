`timescale 1ns / 1ps
module booth_mul_16bit_tb;
reg clk,en;
reg signed [15:0] A,B;
wire signed [31:0] Prod;
wire done;

Booth_Multiplier M1(.clk(clk),.en(en),.A(A),.B(B),.Prod(Prod),.done(done));

initial begin
clk = 1'b0;

A = 8'd0; B = 8'd0; en = 1'b0; #10;

en = 1'b1; A = 16'd12; B = 16'd5; #100; 
en = 1'b0; #100;


en = 1'b1; A = -16'd15; B = -16'd10; #100; 
en = 1'b0; #100;

en = 1'b1;A = -16'd9; B = 16'd11; #100; 
en = 1'b0; #100;

en = 1'b1;A = -16'd10; B = -16'd34; #100; 
en = 1'b0; #100;
end


always #1 clk = !clk;

initial 
begin
$monitor("A = %d, B = %d, Prod = %d,done = %b",A,B,Prod,done);
end


endmodule

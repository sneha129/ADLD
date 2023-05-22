module cyclic_lamtb;
reg clk;
wire [0:2] light;
cyclic_lamp LAMP(clk, light);
always #5 clk = ~clk;
initial
begin
clk = 1'b0;
#100 $finish;
end
initial
begin
//$dumpfile ("cyclic.vcd");
//$dumpvars (0, test_cyclic_lamp);
$monitor ($time, " RGY: %b", light);
end
endmodule


module cyclic_lamp (clk, light);
input clk;
output reg [0:2] light;
parameter S0=0, S1=1, S2=2;
parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
reg [0:1] state;
always @(posedge clk)
case (state)
S0: begin
// S0 means RED
light <= GREEN; state <= S1;
end

S1: begin
// S1 means GREEN
light <= YELLOW; state <= S2;
end

S2: begin
// S2 means YELLOW	
light <= RED; state <= S0;
end

default: begin
light <= RED;
state <= S0;
end
endcase
endmodule	

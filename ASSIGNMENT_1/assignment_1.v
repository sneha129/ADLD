module assgn_1(front_sen,back_sen,password,gate_open,vehicle_det,vehicle_parked);
input front_sen,back_sen;
input [7:0]password;
reg done=0;
output  reg  gate_open,vehicle_det,vehicle_parked;


always @(*)
begin
if(front_sen==1 )begin
vehicle_det <= #1 1'b1;
done <= #1 1'b0;
end
else
vehicle_det <= #1 1'b0;
end

always @(*)
begin
if(vehicle_det==1)
if(password==8'b01100110)
gate_open <= #1 1'b1;
else
gate_open <= #1 1'b0;
end

always @(*)
begin
if(gate_open)
if(back_sen==1)begin
vehicle_parked <= #1 1'b1;
vehicle_det <= #1 1'b0;
done <= #20 1'b1;
end
else
vehicle_parked <= #1 1'b0;
end

always @(*)
begin
if(done)begin

gate_open <= #1 1'b0;
vehicle_parked <= #1 1'b0;
end
end
endmodule

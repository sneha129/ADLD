module assgn_1test;
reg front_sen,back_sen;
reg [7:0]password;
wire gate_open,vehicle_det,vehicle_parked;

assgn_1 sa (front_sen,back_sen,password,gate_open,vehicle_det,vehicle_parked);

initial begin
front_sen=0;
back_sen=0;
password=0;
#5
$display (" vehicle_detected: %d \n gate_opened: %d \n vehicle_parked: %d",vehicle_det,gate_open,vehicle_parked);

#20

front_sen=1;
back_sen=0;
password=0;
#5
$display ("\n vehicle_detected: %d \n gate_opened: %d \n vehicle_parked: %d",vehicle_det,gate_open,vehicle_parked);

#20

front_sen=1;
back_sen=0;
password=8'b01100111;
#5
$display ("\n vehicle_detected: %d \n gate_opened: %d \n vehicle_parked: %d",vehicle_det,gate_open,vehicle_parked);

#20

front_sen=1;
back_sen=0;
password=8'b01100110;
#5
$display ("\n vehicle_detected: %d \n gate_opened: %d \n vehicle_parked: %d",vehicle_det,gate_open,vehicle_parked);

#20

front_sen=0;
back_sen=1;
password=8'b01100110;
#5
$display ("\n vehicle_detected: %d \n gate_opened: %d \n vehicle_parked: %d",vehicle_det,gate_open,vehicle_parked);

#20

front_sen=0;
back_sen=0;
password=8'b00000000;
#5
$display ("\n vehicle_detected: %d \n gate_opened: %d \n vehicle_parked: %d",vehicle_det,gate_open,vehicle_parked);


end
endmodule




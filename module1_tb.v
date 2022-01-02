module module1_tb;
reg entry;
reg[7:0] parking_capacity;
wire[2:0] park_number;

entry_park uut(entry, parking_capacity, park_number);

always @(*) begin
    entry = 1'b1;
    paarking_capacity = 8'b10100000;
    #20;
    entry = 1'b1;
    paarking_capacity = 8'b00100000;
    #20;
    entry = 1'b1;
    paarking_capacity = 8'b00000000;
    #20;
    entry = 1'b0;
    paarking_capacity = 8'b10100000;
    #20;

end
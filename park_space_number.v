`timescale 1 ns/1 ns
module park_space_number(
 enable,
 parking_capacity,
 park_number);
    input enable;
    input [7:0] parking_capacity;
    output reg [2:0] park_number;

    always @(*) begin
        if (enable) begin
            case (parking_capacity)
            8'bxxxxxxx1: park_number = 3'b000;
            8'bxxxxxx10: park_number = 3'b001;
            8'bxxxxx100: park_number = 3'b010;
            8'bxxxx1000: park_number = 3'b011;
            8'bxxx10000: park_number = 3'b100;
            8'bxx100000: park_number = 3'b101;
            8'bx1000000: park_number = 3'b110;
            8'b10000000: park_number = 3'b111;
            endcase
        end
        else begin
            park_number = 3'bzzz;
        end
      
    end
 // write your code here, please.
endmodule

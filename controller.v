/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2021-2022
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: controller
-----------------------------------------------------------*/
`timescale 1 ns/1 ns
module controller(
input [2:0] system_token,
input request,
input [7:0] TimeData,
input reset,
input clock,
input confirm,
input [2:0] user_token,
output reg[7:0] data_Q,
output reg[7:0] data_P
);

    reg[2:0] state;
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
    //s0 = A, s1 = B, s2 = C, s3 = D, s4 =E

    reg RegP, RegQ;
    reg inP, inQ, rst;

    register P(inP,clock,rst,RegP,data_P);
    register Q(inQ,clock,rst,RegQ,data_Q);


    always @(posedge clock or posedge reset) begin
        if (reset) begin
           RegP <= 1'b0;
           RegQ <= 1'b0; 
           state <= s0; 
           rst = 1'b1;
        end
        else begin
            case (state)
                s0:
                if (request) begin
                    state <= s1;
                end

                s1:
                 if (request == 1'b0) begin
                      RegP <= 1'b0;
                      RegQ <= 1'b0; 
                      state <= s0;
                end
                else begin
                    if (confirm) begin
                        if (system_token == user_token) begin
                            state <= s2;
                        end
                        else begin
                            state <= s4;
                        end
                    end
                end

                s2:
                if (request == 1'b0) begin 
                    RegP <= 1'b0;
                    RegQ <= 1'b0;
                    state <= s0;
                end
                else begin
                    state <= s3;
                    RegP <= 1'b1;
                    RegQ <= 1'b1;
                    rst <= 1'b0;
                end

                s3:
                if (request == 1'b0) begin
                    RegP <= 1'b0;
                    RegQ <= 1'b0;
                    state <= s0;
                end
                else begin
                    if (confirm) begin
                        if (TimeData[4] && TimeData[5] && TimeData[6] && TimeData[7]) begin
                            inP <= TimeData;
                            RegQ = 1'b0;
                        end
                        else begin
                            inQ <= TimeData;
                            RegP = 1'b0; 
                        end
                    end
                end

                s4:
                if (request == 1'b0) begin
                    state <= s0;
                end

            endcase
        end
        
    end
endmodule
`timescale 1 ns/1 ns
module entry_checker(
 entry,
 parking_capacity,
 enable);

    input entry;
    input [7:0] parking_capacity;
    output enable;
    
    //Xa' + Xb' + ... + Xn' = (Xa*Xb*...*Xn)'
    nand (enable, parking_capacity[7], parking_capacity[6],
    parking_capacity[5], parking_capacity[4], parking_capacity[3]
    parking_capacity[2], parking_capacity[1], parking_capacity[1]);
        
    end

endmodule
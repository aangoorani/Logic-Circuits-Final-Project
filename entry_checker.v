`timescale 1 ns/1 ns
module entry_checker(
 entry,
 parking_capacity,
 enable);

    input entry;
    input [7:0] parking_capacity;
    output enable;
    integer i, b;
	wire reg tmp;
    
	 always @ (entry or parking_capacity)
		begin
			b = 0;
			for(i=0; i <= 7 ; i = i+1)
				b = b + parking_capacity[i];
			if(b > 0 && enable)
				 tmp = 1'b1;
			else
				 tmp = 1'b0;
      end
		assign enable = tmp;

endmodule

module DT(
	input 			clk, 
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	reg 	[9:0]	sti_addr ,
	input			[15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	reg 	[7:0]	res_do,
	input			[7:0]	res_di
	);

reg [7:0] row_counter;//count row addr
reg [7:0] col_counter; // count column addr

wire [15:0] addr_counter;
assign addr_counter= row_counter*128 +col_counter;

reg [3:0] save_cnr;
reg [3:0] bit_cnr;

reg [7:0] front;
reg [7:0] result;

reg back_flag;

wire [3:0]bit;
assign bit = bit_cnr;

// wire bit_check;
// assign bit_check =  (!sti_di[4'd15-bit]);

reg bit_check;
always @(posedge clk or negedge reset) begin
	if(!reset)
		bit_check <= 1'b0;
	else if(!back_flag)
		bit_check<= !sti_di[4'd15-bit];
	else 
		bit_check <= 1'b0;
	
end

always @(posedge clk or negedge reset) begin
	if(!reset)
		back_flag <= 1'b0;
	else if ( !back_flag && row_counter == 8'd126 && col_counter == 8'd127 && (save_cnr == 4'd3))
		back_flag <= 1'b1;
	else 
		back_flag<= back_flag;
	
end

//count column from 0~7
always @(posedge clk or negedge reset) begin
	if(!reset)
		col_counter <= 8'b0;
	else if((!back_flag) && (save_cnr == 4'd3))
		col_counter <= col_counter == 8'd127 ? 8'd0 : col_counter +1;
	else if((save_cnr == 4'd4) && back_flag)
		col_counter <= col_counter == 8'd0 ? 8'd127 : col_counter -1;
	else 
		col_counter <= col_counter;
	
end


always @(posedge clk or negedge reset) begin
	if(!reset)
		row_counter <= 8'b1;
	else if ((!back_flag) && (save_cnr == 4'd3)  && (col_counter == 8'd127))
		row_counter <=   row_counter + 1 ;
	else if(back_flag && (save_cnr == 4'd4) &&  (col_counter == 8'd0))
		row_counter <=   row_counter -1 ;
	else 
		row_counter <= row_counter; 
	
end

//count 16 bits
always @(posedge clk or negedge reset) begin
	if(!reset)
		bit_cnr <= 4'b0;
	
	else if(save_cnr == 4'd3 && (!back_flag))
		bit_cnr <= bit_cnr == 4'd15 ? 4'b0 : bit_cnr +1;	
	else if ((!back_flag))
		bit_cnr <= bit_cnr;
	else 
		bit_cnr <= 4'b0;
end

reg if_save_0;
always@(*)begin
	if_save_0 = save_cnr == 4'b0;
end

reg if_save_3;
always@(*)begin
	if_save_3 = save_cnr == 4'd3;
end

reg if_save_4;
always@(*)begin
	if_save_4 = save_cnr == 4'd4;
end
reg back_start;
always@(*)begin
	back_start = row_counter == 8'd126 && col_counter == 8'd127;
end





 //save_cnr: get three reg data
always @(posedge clk or negedge reset) begin
	if(!reset)
		save_cnr <= 4'b0;
	else if ((!back_flag) && row_counter == 8'd126 && col_counter == 8'd127)
		save_cnr <= 4'd3;
	else if ((!back_flag) && bit_check && if_save_0)
		save_cnr <=  4'd3;
	
	else if((!back_flag) && if_save_3)
		save_cnr <=  4'b0 ;
	else if (back_flag && (res_di == 8'b0) && if_save_0)
		save_cnr <=  4'd4 ;
	else if(back_flag && if_save_4)
		save_cnr <=  4'b0 ;
	else
		save_cnr <= save_cnr +1;		
end


//sti_rd
always @(posedge clk or negedge reset)begin
	if(!reset)
		sti_rd <= 1'b0;
	else if(!back_flag)
		sti_rd <= 1'b1;
	else 
		sti_rd <= 1'b0;

end

//define sti_addr
always @(posedge clk or negedge  reset)begin
	if (!reset)
		sti_addr <= 10'd8;
	else if(bit_cnr == 4'd15 && (!back_flag) &&(save_cnr == 4'd3))
		sti_addr <=  sti_addr +1;
	else 
		sti_addr <= sti_addr;
end



//res_wr
always@(*)begin
    if(if_save_3 &&(!back_flag))
		res_wr = 1'b1;
	else if(if_save_4 &&(back_flag))
		res_wr = 1'b1;
	else 
		res_wr = 1'b0;
end



// //res_rd
always@(*)begin
    if((save_cnr < 4'd3) &&(!back_flag))
		res_rd = 1'b1;
	else if((save_cnr < 4'd4) &&(back_flag))
		res_rd = 1'b1;
	else 
		res_rd = 1'b0;
end




//res_addr
always@(posedge clk or negedge reset)begin
	if(!reset)
		res_addr <= 14'b0;
    else if ((!back_flag) &&( (bit_check && if_save_0) || save_cnr == 4'd2  ) )//write the result 
		res_addr <= addr_counter;//(row_counter << 7) + col_counter;
	else if (back_flag &&( if_save_3 ))//write the result 
		res_addr <= addr_counter ;//row_counter << 7 + col_counter;
	else if (back_flag &&( if_save_4 ))//write the result 
		res_addr <= addr_counter -1;//row_counter << 7 + col_counter;
	else if (back_flag &&(((res_di == 8'b0) && if_save_0) ))//write the result 
		res_addr <= addr_counter;//row_counter << 7 + col_counter;

	else if(!back_flag)// read three data		
		res_addr <= ((row_counter-1) << 7) + col_counter  + (save_cnr %3);
	else if(back_flag)// read three data		
		res_addr <= ((row_counter+1) << 7) + col_counter -1 +save_cnr;
	else 
		res_addr <= 14'b0;
	
end



//res_do
always@(*)begin
    if(!back_flag && save_cnr == 4'd3)
		res_do = bit_check ? 8'b0 :  result;
	else if (row_counter == 8'd127 )
		res_do = 8'b0;
	else if(back_flag && save_cnr == 4'd4)
		res_do = result;
	else 
		res_do = 8'b0;
end



reg [7:0] res_di_plus;

always@(*)begin
	res_di_plus = res_di + 8'b1; 
end

always@(posedge clk or negedge reset)begin
	if(!reset)
		result <= 8'b0;
	else if(back_flag && save_cnr == 4'd0 && (res_di == 8'b0))
		result <=  8'b0  ;
	else if(back_flag && save_cnr == 4'd0 && (res_di < result ))
		result <=    res_di ;
	else if((!back_flag) && save_cnr == 4'd3)
		result <=  front +1;
	else if ((save_cnr < 4'd4) && ( result > res_di_plus )  )
		result <= res_di_plus ;	
	else if((save_cnr == 4'd4) && back_flag)
		result <= front +1;//( result < front +1 ) ? result : front +1 ;
	else 
		result <= result;

end



always@(*)begin
	if( !back_flag && save_cnr == 4'd3)
		front = bit_check ? 8'b0 :  result;//result;
	else if( back_flag && save_cnr == 4'd4)
		front = result;
	else 
		front= 8'b0;
	
end

//done
always@(posedge clk or negedge reset)begin
	if(!reset)
		done <= 1'b0;
	else if (back_flag &&(row_counter == 8'd1) &&(col_counter == 8'd1))
		done<= 1'b1;
end



endmodule

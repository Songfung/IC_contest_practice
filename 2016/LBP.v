
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output  [13:0] 	gray_addr;
output         	gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output  [13:0] 	lbp_addr;
output  	lbp_valid;
output  [7:0] 	lbp_data;
output  	finish;
//====================================================================

reg [13:0] 	gray_addr;
reg        	gray_req;
reg [13:0] 	lbp_addr;
reg 	    lbp_valid;
reg [7:0] 	lbp_data;
reg         finish;

reg [3:0]   pix_cnr; //counter request pixel number count 1~9
reg [7:0]   p2 ;
reg [7:0]   center_data;
// reg [7:0]   next_center_data;


reg [6:0] row_cnr;
reg [6:0] col_cnr;

wire [13:0]  center_cnr;
assign center_cnr = (row_cnr << 7) + col_cnr;


wire [7:0] add_four;
wire [7:0] add_zero;
assign add_four = ( ( gray_data >= center_data) << (pix_cnr-4'd2));
assign add_zero = ( ( gray_data >= center_data) << (pix_cnr-4'd1));

wire edge1;
assign edge1 =   row_cnr == 7'd127 || col_cnr == 7'd127 || col_cnr == 7'd0  ;


wire end_cal;
assign end_cal = pix_cnr == 4'd9 || (edge1 ) ;




always@(posedge clk or posedge reset)begin
    if(reset)
        pix_cnr <= 4'd8;
    else if (edge1 )
        pix_cnr <= 4'b0;
    else 
        pix_cnr <=  pix_cnr == 4'd9 ? 4'b0 : (pix_cnr==3 ? pix_cnr + 3 : pix_cnr + 1);
end


always@(posedge clk or posedge reset)begin
    if(reset)
        gray_req <= 1'b0;
    else if(gray_ready)
        gray_req <=  1'b1 ;
end


always@(posedge clk or posedge reset)begin
    if(reset)
        row_cnr <= 7'b0;
    else if (end_cal && col_cnr == 7'd127 )
        row_cnr <= row_cnr +1;
end

always@(posedge clk or posedge reset)begin
    if(reset)
        col_cnr <= 7'd127;
    else if (end_cal)
        col_cnr <= col_cnr == 7'd127 ? 7'b0 : col_cnr +1;
end



always@(posedge clk or posedge reset)begin
        if(reset)
            gray_addr <= 14'd0;
        else if(edge1)
            gray_addr <= center_cnr + 14'h1;
        else if (pix_cnr == 4'd0 )
            gray_addr <= center_cnr - 14'h81 ;
        else if (pix_cnr == 4'd1)
            gray_addr <= center_cnr - 14'h80 ;
        else if (pix_cnr == 4'd2)
            gray_addr <= center_cnr - 14'h7F ;
        else if (pix_cnr == 4'd3)
            gray_addr <= center_cnr + 14'h1;
        else if (pix_cnr == 4'd6)
            gray_addr <= center_cnr + 14'h7F;
        else if (pix_cnr == 4'd7)
            gray_addr <= center_cnr + 14'h80;
        else if (pix_cnr == 4'd8)
            gray_addr <= center_cnr + 14'h81;
        else 
            gray_addr <= center_cnr + 14'h1;

        
end


always@(posedge clk or posedge reset)begin
    if(reset)
        center_data <= 8'b0;
    else if((gray_req && pix_cnr == 4'd0) || edge1 )
        center_data <= gray_data;
        
end


always@(posedge clk or posedge reset)begin
    if(reset)
        lbp_data <= 8'b0;
    else if (edge1 )
        lbp_data <= 8'b0;
    else if (pix_cnr == 4'd0 && center_cnr !=14'h80)
        lbp_data <= ( ( gray_data <= center_data) << 3);
    else if(pix_cnr == 4'd0) 
        lbp_data <= 8'b0;
    else if(gray_req && (  pix_cnr <= 4'd3))
        lbp_data <= lbp_data + add_zero;
    else if(gray_req && (pix_cnr >= 4'd6 ))
        lbp_data <= lbp_data + add_four; 
end

always@(*)begin
        lbp_addr = center_cnr - 14'd1;
end

always@(posedge clk or posedge reset)begin
    if(reset)
        lbp_valid <=1'b0;
    else if( pix_cnr == 4'd9 || (edge1 && (col_cnr != 7'd0)  ) ) 
        lbp_valid <= 1'b1;
    else
        lbp_valid <= 1'b0;
        
end

always@(posedge clk or posedge reset)begin
    if(reset)
        finish <=1'b0;
    else if( center_cnr == 14'd16255 && lbp_valid)
        finish <= 1'b1;
        
end

//====================================================================
endmodule

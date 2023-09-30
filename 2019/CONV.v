T`timescale 1ns/10ps
module  CONV(clk,reset,cdata_rd,ready,idata,iaddr,cwr,caddr_wr,cdata_wr,crd,caddr_rd,busy,csel);

input clk;
input reset;
input [19:0] cdata_rd;
input ready;	
input signed [19:0] idata;	

output reg [11:0] iaddr;	
output reg cwr;
output reg [11:0] caddr_wr;
output reg [19:0] cdata_wr;
output reg crd;
output reg [11:0] caddr_rd;
output reg busy;
output reg [2:0] csel;


reg [5:0] row_cnr; // row addr counter
reg [5:0] col_cnr; // column addr counter
reg [3:0] block_cnr; // count the nine elements to get layer 0 output;
reg signed [19:0] maxpool_result;

//wire [1:0] block_mod3 = block_cnr == 4'b0 ? 2'd2 :(block_cnr - 4'b1) % 3;
wire [11:0] current_addr = ((row_cnr ) << 6 ) + col_cnr;
reg conv_maxpool; //flag that divide into two part(conv & maxpool)

reg [1:0] block_mod3 ;

always @(posedge clk or posedge reset ) begin
    if(reset)
		block_mod3 <= 1'b0;
	else 
		block_mod3 <= block_cnr == 4'd9 ? 2'd2 :(block_cnr - 4'd1) % 3;
end


// define conv_maxpool
always @(posedge clk or posedge reset) begin
	if(reset)
		conv_maxpool <= 1'b0;
	else if((col_cnr == 6'd63) && (row_cnr == 6'd63) && (block_cnr == 4'd9))
		conv_maxpool <= 1'b1;
    else 
        conv_maxpool <= conv_maxpool; 	
end

// define col_cnr
always @(posedge clk or posedge reset) begin
	if(reset)
		col_cnr <= 6'b0;
	else if( (block_cnr == 4'd9) && (!conv_maxpool))
		col_cnr <= (col_cnr == 6'd63) ? 6'b0 : col_cnr + 6'b1;
    else if( (block_cnr == 4'd4) && (conv_maxpool))
		col_cnr <= (col_cnr == 6'd31) ? 6'b0 : col_cnr + 6'b1; 
    else if( (col_cnr == 6'd63) && (conv_maxpool))
		col_cnr <= 6'b0 ;	
end

//define row_cnr
always @(posedge clk or posedge reset) begin
	if(reset)
		row_cnr <= 6'b0;
	else if((col_cnr == 6'd63) && (!conv_maxpool) && (block_cnr == 4'd9))
		row_cnr <= (row_cnr == 6'd63) ? 6'b0 : row_cnr + 6'b1;
    else if((col_cnr == 6'd31) && (conv_maxpool) && (block_cnr == 4'd4) )
		row_cnr <= (row_cnr == 6'd32) ? 6'b0 : row_cnr + 6'b1;
	
end




//define get nine address of one  block in convolution
//get four data in maxpooling
always @(posedge clk or posedge reset) begin
	if(reset)
		block_cnr <= 4'd15;
	else if(!conv_maxpool)
		block_cnr <= (block_cnr == 4'd9) ? 4'b0 : ( block_cnr + 4'b1 );
    else if(conv_maxpool)begin
        block_cnr <= (block_cnr == 4'd4) ? 4'b0 : ( block_cnr + 4'b1 );
    end
end

//define iaddr
always @(posedge clk or posedge reset) begin
	if(reset)
		iaddr <= 6'b0;
	else if(block_cnr < 4'd3)
        iaddr <=  ((row_cnr + block_cnr  - 4'd1  ) << 6 ) + col_cnr - 6'd1;
    else if(block_cnr < 4'd6)
        iaddr <=  ((row_cnr + block_cnr  - 4'd1 - 4'd3) << 6 ) + col_cnr ;
    else if(block_cnr < 4'd9)
        iaddr <=  ((row_cnr + block_cnr   - 4'd1 - 4'd6) << 6 ) + col_cnr + 6'd1;
    else 
        iaddr <= 4'b0;

	
end

parameter bit_extension = 9;

reg signed [44:0] result_KelCol1;
reg signed [44:0] result_KelCol2;
reg signed [44:0] result_KelCol3;

wire signed [19:0] ker0 = 20'h0A89E ;
wire signed [19:0] ker1 = 20'h01004 ;
wire signed [19:0] ker2 = 20'hFA6D7 ;
wire signed [19:0] ker3 = 20'h092D5 ;
wire signed [19:0] ker4 = 20'hF8F71 ;
wire signed [19:0] ker5 = 20'hFC834 ;
wire signed [19:0] ker6 = 20'h06D43 ;
wire signed [19:0] ker7 = 20'hF6E54 ;
wire signed [19:0] ker8 = 20'hFAC19 ;
wire signed [44:0] bias = { {9{1'b0}}, 20'h01310, {16{1'b0}}} ;


reg signed [39:0] ker0_idata ;
reg signed [39:0] ker1_idata ;
reg signed [39:0] ker2_idata ;
reg signed [39:0] ker3_idata ;
reg signed [39:0] ker4_idata ;
reg signed [39:0] ker5_idata ;
reg signed [39:0] ker6_idata ;
reg signed [39:0] ker7_idata ;
reg signed [39:0] ker8_idata ;


//define result1
always @(posedge clk or posedge reset) begin
	if(reset)begin
		ker0_idata <= 40'b0;
        ker1_idata <= 40'b0;
        ker2_idata <= 40'b0;
        ker3_idata <= 40'b0;
        ker4_idata <= 40'b0;
        ker5_idata <= 40'b0;
        ker6_idata <= 40'b0;
        ker7_idata <= 40'b0;
        ker8_idata <= 40'b0;
    end
    else begin
        ker0_idata <= {{20{ker0[19]}},ker0} *{{20{idata[19]}}, idata};
        ker1_idata <= {{20{ker1[19]}},ker1} *{{20{idata[19]}}, idata};
        ker2_idata <= {{20{ker2[19]}},ker2} *{{20{idata[19]}}, idata};
        ker3_idata <= {{20{ker3[19]}},ker3} *{{20{idata[19]}}, idata};
        ker4_idata <= {{20{ker4[19]}},ker4} *{{20{idata[19]}}, idata};
        ker5_idata <= {{20{ker5[19]}},ker5} *{{20{idata[19]}}, idata};
        ker6_idata <= {{20{ker6[19]}},ker6} *{{20{idata[19]}}, idata};
        ker7_idata <= {{20{ker7[19]}},ker7} *{{20{idata[19]}}, idata};
        ker8_idata <= {{20{ker8[19]}},ker8} *{{20{idata[19]}}, idata};
    end
	
	
end


//define result1
always @(posedge clk or posedge reset) begin
	if(reset)
		result_KelCol1 <= 45'b0;
    else if ( (col_cnr == 6'b0) && (block_cnr < 4))
        result_KelCol1 <= 45'b0;
    else 
    case(block_mod3)
            2'b00: result_KelCol1 <=  (row_cnr == 6'b0) ? 41'b0 : {{bit_extension{ker0_idata[35]}},ker0_idata[35:0]}  ;
            2'b01: result_KelCol1 <= result_KelCol1 + {{bit_extension{ker1_idata[35]}},ker1_idata[35:0]}; // ker1_idata [35:15] ;
            2'b10: result_KelCol1 <=  (row_cnr == 6'd63) ? result_KelCol1 : result_KelCol1 + {{bit_extension{ker2_idata[35]}},ker2_idata[35:0]}; //ker2_idata [35:15] ;
            default : result_KelCol1 <= 45'b0;
    endcase
	
	
end

//define result2
always @(posedge clk or posedge reset) begin
	if(reset)
		result_KelCol2 <= 45'b0;      
    else
    case(block_mod3)
            2'b00: result_KelCol2 <= (row_cnr == 6'b0) ? result_KelCol1 : result_KelCol1 + {{bit_extension{ker3_idata[35]}},ker3_idata[35:0]};//ker3_idata [35:15] ;
            2'b01: result_KelCol2 <= result_KelCol2 + {{bit_extension{ker4_idata[35]}},ker4_idata[35:0]};//ker4_idata [35:15] ;
            2'b10: result_KelCol2 <= (row_cnr == 6'd63) ? result_KelCol2 : result_KelCol2 + {{bit_extension{ker5_idata[35]}},ker5_idata[35:0]} ;//ker5_idata [35:15] ;
            default : result_KelCol2 <= 45'b0;
    endcase
	
	
end

wire signed [29:0] result3_ker8 = result_KelCol3 + {{bit_extension{ker8_idata[35]}},ker8_idata[35:0]};//ker8_idata[35:15];

wire signed [29:0] result3_ker8bias = result_KelCol3 + {{bit_extension{ker8_idata[35]}},ker8_idata[35:0]} + bias;

//define result3
always @(posedge clk or posedge reset) begin
	if(reset)
		result_KelCol3 <= 45'b0;
    else if ( (col_cnr == 6'd63) && (block_cnr == 4'd8))
        result_KelCol3 <= result_KelCol2 + bias;

    else
    case(block_mod3)
            2'b00: result_KelCol3 <= (row_cnr == 6'b0) ? result_KelCol2 :result_KelCol2 + {{bit_extension{ker6_idata[35]}},ker6_idata[35:0]};// ker6_idata [35:15] ;
            2'b01: result_KelCol3 <= result_KelCol3 + {{bit_extension{ker7_idata[35]}},ker7_idata[35:0]};//ker7_idata[35:15] ;
            2'b10: result_KelCol3 <= (row_cnr == 6'd63) ? result_KelCol3 + bias  :result_KelCol3 + {{bit_extension{ker8_idata[35]}},ker8_idata[35:0]} + bias ; 
            default : result_KelCol3 <= 45'b0;
    endcase
	
	
end


//define cwr
always @(posedge clk or posedge reset) begin
	if(reset)
		cwr <= 1'b0;
    else if((col_cnr == 6'd63) &&(block_cnr == 4'd8) && (!conv_maxpool))
        cwr <= 1'b1;
    else if((!(col_cnr == 6'd0) ) &&(block_cnr == 4'd0) && (!conv_maxpool))
        cwr <= 1'b1;
    else if((block_cnr == 4'd4) && (conv_maxpool))
        cwr <= 1'b1;
    else
        cwr <= 1'b0;
		
end
wire bit44 =result_KelCol3[44];

// wire kelcol3_20 = result_KelCol3[20];
// wire kelcol3_19 = result_KelCol3[19];
// wire kelcol3_18 = result_KelCol3[18];
// wire kelcol3_17 = result_KelCol3[17];
// wire kelcol3_0 = result_KelCol3[0];
// wire kelcol3_1 = result_KelCol3[1];
// wire kelcol3_2 = result_KelCol3[2];
//define cdata_wr
always @(*) begin
    if(!conv_maxpool)
        cdata_wr = (result_KelCol3[44] == 0) ? result_KelCol3[37 : 16] + result_KelCol3[15]  : 20'b0 ;	//reLU
    else if(conv_maxpool )
        cdata_wr = maxpool_result;
end

// //define cdata_wr
// always @(posedge clk or posedge reset) begin
//     if(reset)
//         cdata_wr <= 20'b0;
//     else if(!conv_maxpool)
//         cdata_wr <= (result_KelCol3[19] == 0) ? result_KelCol3 : 20'b0 ;	
//     else if(conv_maxpool)
//         cdata_wr <= maxpool_result;
// end

//define caddr_wr
always @(posedge clk or posedge reset) begin
	if(reset)
		caddr_wr <= 12'b0;
    
    else if( (!conv_maxpool) && (col_cnr == 6'd63) &&(block_cnr == 4'd8) )
        caddr_wr <=  (row_cnr << 6) + col_cnr ;
    
    else if(!conv_maxpool)
        caddr_wr <=   (row_cnr << 6) + col_cnr - 12'b1;
    else if(conv_maxpool)
        caddr_wr <= (row_cnr << 5) + col_cnr ;
    else 
        caddr_wr <= caddr_wr;
		
end

//define csel
always @(posedge clk or posedge reset) begin
	if(reset)
		csel <= 3'b0;
    else if(!conv_maxpool)
        csel <= 3'b001;
    else if(conv_maxpool && (block_cnr == 4'd4) )
        csel <= 3'b011;
    else if(conv_maxpool)
        csel <= 3'b001;
    
		
end

//define crd

always @(posedge clk or posedge reset) begin
	if(reset)
		crd <= 1'b0;
    else if(conv_maxpool)
        crd <= 1'b1;
		
end

//define caddr_rd
always @(posedge clk or posedge reset) begin
	if(reset)
		caddr_rd <= 12'b0;
    else if(!conv_maxpool)
        caddr_rd <= 12'b0;
    else if(conv_maxpool)begin
        if(block_cnr < 4'd2)
            caddr_rd <= (row_cnr << 7) + (col_cnr << 1) + block_cnr;
        else if(block_cnr < 4'd4)
            caddr_rd <= ((row_cnr<< 7 )+ (1 << 6 ) ) + (col_cnr << 1) + block_cnr - 12'd2;
        else 
            caddr_rd <= 12'b0;
    end
    else 
            caddr_rd <= 12'b0;
    
		
end

//define maxpool-result
always @(posedge clk or posedge reset) begin
	if(reset)
		maxpool_result <= 20'b0;
    else if(!conv_maxpool)
        maxpool_result <= 20'b0;
    else if(conv_maxpool)begin
        if((block_cnr == 4'd1))
            maxpool_result <=cdata_rd;
        else if((block_cnr <= 4'd4) && (block_cnr > 4'd1))
            maxpool_result <=( maxpool_result < cdata_rd) ? cdata_rd : maxpool_result;
        else 
            maxpool_result <= maxpool_result;
    end
    else 
            maxpool_result <= 20'b0;
    
		
end

//define busy

always @(posedge clk or posedge reset) begin
	if(reset)
		busy <= 1'b0;
    else if(conv_maxpool && (col_cnr == 6'd0) && (row_cnr == 6'd32) && (block_cnr == 4'd0))
        busy <= 1'b0;
    else if(ready)
        busy <= 1'b1;
    else 
        busy <= busy;
		
end



















endmodule
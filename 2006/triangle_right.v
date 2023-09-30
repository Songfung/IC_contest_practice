module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);
  input clk, reset, nt;
  input [2:0] xi, yi;
  output busy, po;
  output [2:0] xo, yo;
  

reg [2:0] x1, x2, x3, y1, y2, y3;
reg busy,po;
reg [2:0] xo, yo;
reg [1:0] in_cnt;
reg [3:0] x_cnt,y_cnt;

wire [5:0]test1;
wire [5:0]test2;
assign test1 = ( y3 - y_cnt )*(x2 - x3);
assign test2 = (y3 -y2 )*(x_cnt - x3);

wire signed [5:0] minus;
assign minus = ( ( y3 - y_cnt )*(x2 - x3) - (y3 -y2 )*(x_cnt - x3));
wire check;
assign check = minus >= 0; //
wire check_left;
assign check_left = minus <=0;

wire if_large ;//record  if x2 larger
assign if_large = x1 < x2;

always@(posedge clk or posedge reset)
begin
  if(reset)
    busy <= 0;
  else if(in_cnt == 2'b01)
    busy <= 1;
  else if(if_large && x_cnt == x2 + 3'b1 && y_cnt == y3 +3'b1)
    busy <= 0;
  else if(!if_large && x_cnt == x1 +3'b1 && y_cnt == y3 +3'b1)
    busy <= 0;
  else
    busy <= busy;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    in_cnt <= 0;
  else if(nt)
    in_cnt <= 1;
  else
    in_cnt <= in_cnt == 2'b11 ? in_cnt : in_cnt + 1;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x_cnt <= 0;
  else if(busy)
    if(if_large)
      x_cnt <= x_cnt == x2 + 3'b1 ? x1 -1 : x_cnt + 1;
    else
      x_cnt <= x_cnt == x1 + 3'b1 ? x2 -1, : x_cnt + 1;
  
    
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y_cnt <= 0;
  else if(busy)
    if(if_large && x_cnt === x2 + 3'b1)     
        y_cnt <= y_cnt == y3 +3'b1 ? y1 : y_cnt + 1;
    else if (!if_large && x_cnt === x1 + 3'b1)
        y_cnt <= y_cnt == y3 +3'b1 ? y2 : y_cnt + 1;
      
  
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x1 <= 0;
  else if(nt)
    x1 <= xi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x2 <= 0;
  else if(in_cnt == 2'b01)
    x2 <= xi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    x3 <= 0;
  else if(in_cnt == 2'b10)
    x3 <= xi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y1 <= 0;
  else if(nt)
    y1 <= yi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y2 <= 0;
  else if(in_cnt == 2'b01)
    y2 <= yi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    y3 <= 0;
  else if(in_cnt == 2'b10)
    y3 <= yi;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    xo <= 0;
  else if(busy)
    if(check  && x_cnt >= x1 && x_cnt <= x2 && if_large)
      xo <= x_cnt;
    else if(check_left  && x_cnt >= x2 && x_cnt <= x1 && !if_large)
      xo <= x_cnt;
    else
      xo <= 0;
  else
      xo <= 0;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    yo <= 0;
  else if(busy)
    if(check && y_cnt >= y1 && y_cnt <= y3 && if_large)
      yo <= y_cnt;
    else if(check_left && y_cnt >= y1 && y_cnt <= y3 && !if_large)
      yo<= y_cnt;
    else
      yo <= 0;
  else
      yo <= 0;
end

always@(posedge clk or posedge reset)
begin
  if(reset)
    po <= 0;
  else if(busy)
    if(check  && x_cnt >= x1 && x_cnt <= x2 && y_cnt >= y1 && y_cnt <= y3 && if_large)
      po <= 1;
    else if (check_left  && x_cnt >= x2 && x_cnt <= x1 && y_cnt >= y1 && y_cnt <= y3 && !if_large)
      po <= 1;
    else
      po <= 0;
  else  
    po <= 0;
end


endmodule
